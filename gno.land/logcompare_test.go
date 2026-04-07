package gnoland_test

// go test -run TestCompareRealFiles -v ./gno.land/

import (
	"bufio"
	"fmt"
	"os"
	"strings"
	"testing"
)

const entryPoint = "[Store - SetObject]"

type KVEntry struct {
	PkgPath string
	Key     string
	Value   string
}

func parseKVEntries(filePath string) ([]KVEntry, error) {
	f, err := os.Open(filePath)
	if err != nil {
		return nil, fmt.Errorf("failed to open file %s: %w", filePath, err)
	}
	defer f.Close()

	var entries []KVEntry
	scanner := bufio.NewScanner(f)
	buf := make([]byte, 1024*1024)
	scanner.Buffer(buf, 1024*1024)

	for scanner.Scan() {
		line := scanner.Text()
		idx := strings.Index(line, entryPoint)
		if idx == -1 {
			continue
		}
		rest := strings.TrimSpace(line[idx+len(entryPoint):])
		kv, err := parseKeyValue(rest)
		if err != nil {
			fmt.Fprintf(os.Stderr, "[WARN] skipping line in %s: %v\n", filePath, err)
			continue
		}
		entries = append(entries, kv)
	}
	return entries, scanner.Err()
}

// parseKeyValue parses a log line of the form:
//
//	pkgPath=<path>, key=<key> value=<value>
//
// pkgPath is optional for backwards compatibility with lines that omit it.
func parseKeyValue(s string) (KVEntry, error) {
	var pkgPath string

	pkgIdx := strings.Index(s, "pkgPath=")
	keyIdx := strings.Index(s, "key=")
	valIdx := strings.Index(s, "value=")

	if keyIdx == -1 || valIdx == -1 {
		return KVEntry{}, fmt.Errorf("missing key= or value= in %q", s)
	}

	if pkgIdx != -1 && pkgIdx < keyIdx {
		// Extract pkgPath value: between "pkgPath=" and the next ", key="
		raw := s[pkgIdx+8 : keyIdx]
		pkgPath = strings.TrimRight(strings.TrimSpace(raw), ",")
	}

	key := strings.TrimSpace(s[keyIdx+4 : valIdx])
	val := strings.TrimSpace(s[valIdx+6:])
	if key == "" {
		return KVEntry{}, fmt.Errorf("empty key in %q", s)
	}
	return KVEntry{PkgPath: pkgPath, Key: key, Value: val}, nil
}

func compareKVFiles(t *testing.T, fileA, fileB string) {
	t.Helper()

	entriesA, err := parseKVEntries(fileA)
	if err != nil {
		t.Fatalf("error reading %s: %v", fileA, err)
	}
	entriesB, err := parseKVEntries(fileB)
	if err != nil {
		t.Fatalf("error reading %s: %v", fileB, err)
	}

	t.Logf("FileA: %s (%d entries)", fileA, len(entriesA))
	t.Logf("FileB: %s (%d entries)", fileB, len(entriesB))

	lenA, lenB := len(entriesA), len(entriesB)
	minLen := lenA
	if lenB < minLen {
		minLen = lenB
	}

	for i := 0; i < minLen; i++ {
		a, b := entriesA[i], entriesB[i]
		if a.PkgPath != b.PkgPath {
			t.Fatalf("[%d번째 키 탐색 중 발견] pkgPath 불일치:\n  A: %q\n  B: %q", i, a.PkgPath, b.PkgPath)
		}
		if a.Key != b.Key {
			t.Fatalf("[%d번째 키 탐색 중 발견] key 순서 불일치:\n  A: %q\n  B: %q", i, a.Key, b.Key)
		}
		if a.Value != b.Value {
			t.Fatalf("[%d번째 키 탐색 중 발견] value 불일치 (pkgPath=%q, key=%q):\n  A: %q\n  B: %q", i, a.PkgPath, a.Key, a.Value, b.Value)
		}
	}

	if lenA != lenB {
		t.Fatalf("[%d번째 키 탐색 중 발견] entry 수 불일치: A=%d B=%d", minLen, lenA, lenB)
	}

	t.Logf("완전 일치 (총 %d개 항목)", lenA)
}

func TestCompareRealFiles(t *testing.T) {
	fileA := "./log.txt"
	fileB := "./log2.txt"
	compareKVFiles(t, fileA, fileB)
}
