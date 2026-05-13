package main

import (
	"bytes"
	"encoding/json"
	"os"
	"path/filepath"
	"strings"
	"testing"
)

func TestCheckedInFixtureMatchesNativeGnoSigning(t *testing.T) {
	t.Parallel()

	fx, signBytes, signedTx, err := buildFixture()
	if err != nil {
		t.Fatal(err)
	}

	var checkedIn fixture
	mustReadJSON(t, filepath.Join(outDir, "fixture.json"), &checkedIn)

	if got, want := fx.PrivateKeyHex, checkedIn.PrivateKeyHex; got != want {
		t.Fatalf("private key mismatch: got %q want %q", got, want)
	}
	if got, want := fx.Address, checkedIn.Address; got != want {
		t.Fatalf("address mismatch: got %q want %q", got, want)
	}
	if got, want := fx.PubKeyHex, checkedIn.PubKeyHex; got != want {
		t.Fatalf("pubkey mismatch: got %q want %q", got, want)
	}
	if got, want := fx.SignBytesHex, checkedIn.SignBytesHex; got != want {
		t.Fatalf("sign bytes hex mismatch:\ngot  %s\nwant %s", got, want)
	}
	if got, want := fx.SignBytesSHA256Hex, checkedIn.SignBytesSHA256Hex; got != want {
		t.Fatalf("sign bytes sha256 mismatch: got %s want %s", got, want)
	}
	if got, want := fx.SignatureHex, checkedIn.SignatureHex; got != want {
		t.Fatalf("signature mismatch:\ngot  %s\nwant %s", got, want)
	}
	if got, want := fx.TxBytesHex, checkedIn.TxBytesHex; got != want {
		t.Fatalf("tx bytes mismatch:\ngot  %s\nwant %s", got, want)
	}
	if got, want := fx.TxHashSHA256Hex, checkedIn.TxHashSHA256Hex; got != want {
		t.Fatalf("tx bytes sha256 mismatch: got %s want %s", got, want)
	}

	assertRawFile(t, filepath.Join(outDir, "sign_bytes.json"), signBytes)
	assertTextFile(t, filepath.Join(outDir, "sign_bytes.hex"), fx.SignBytesHex)
	assertTextFile(t, filepath.Join(outDir, "signature.hex"), fx.SignatureHex)
	assertTextFile(t, filepath.Join(outDir, "tx_bytes.hex"), fx.TxBytesHex)
	assertRawFile(t, filepath.Join(outDir, "signed_tx.json"), prettyJSON(signedTx))
}

func mustReadJSON(t *testing.T, path string, out any) {
	t.Helper()

	bz, err := os.ReadFile(path)
	if err != nil {
		t.Fatal(err)
	}
	if err := json.Unmarshal(bz, out); err != nil {
		t.Fatal(err)
	}
}

func assertRawFile(t *testing.T, path string, want []byte) {
	t.Helper()

	got, err := os.ReadFile(path)
	if err != nil {
		t.Fatal(err)
	}
	if !bytes.Equal(got, want) {
		t.Fatalf("%s mismatch:\ngot  %q\nwant %q", path, got, want)
	}
}

func assertTextFile(t *testing.T, path string, want string) {
	t.Helper()

	got, err := os.ReadFile(path)
	if err != nil {
		t.Fatal(err)
	}
	if strings.TrimSpace(string(got)) != want {
		t.Fatalf("%s mismatch:\ngot  %q\nwant %q", path, strings.TrimSpace(string(got)), want)
	}
}
