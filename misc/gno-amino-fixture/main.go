package main

import (
	"crypto/sha256"
	"encoding/hex"
	"encoding/json"
	"fmt"
	"os"
	"path/filepath"

	"github.com/gnolang/gno/gno.land/pkg/sdk/vm"
	"github.com/gnolang/gno/tm2/pkg/amino"
	"github.com/gnolang/gno/tm2/pkg/crypto"
	"github.com/gnolang/gno/tm2/pkg/crypto/secp256k1"
	"github.com/gnolang/gno/tm2/pkg/std"
)

const (
	outDir        = "testdata/msg_run_basic"
	privateKeyHex = "4e9444a6efd6d42725a250b650a781da2737ea308c839eaccb0f7f3dbd2fea77"
	chainID       = "dev"
	accountNumber = uint64(7)
	sequence      = uint64(3)
	gasWanted     = int64(5000000)
	memo          = "gno amino fixture"
)

const mainGno = `package main

import core "gno.land/r/aib/ibc/core"

func main() {
	clientID := core.CreateClient(core.MsgCreateClient{
		ClientType: "gno",
		ClientState: []byte{1, 2, 3},
		ConsensusState: []byte{4, 5, 6},
	})
	println(clientID)
}
`

type fixture struct {
	PrivateKeyHex      string          `json:"private_key_hex"`
	Address            string          `json:"address"`
	AddressHex         string          `json:"address_hex"`
	PubKeyBech32       string          `json:"pub_key_bech32"`
	PubKeyHex          string          `json:"pub_key_hex"`
	ChainID            string          `json:"chain_id"`
	AccountNumber      uint64          `json:"account_number"`
	Sequence           uint64          `json:"sequence"`
	GasWanted          int64           `json:"gas_wanted"`
	GasFee             string          `json:"gas_fee"`
	Memo               string          `json:"memo"`
	UnsignedTxJSON     json.RawMessage `json:"unsigned_tx_json"`
	MsgRunAminoJSON    json.RawMessage `json:"msg_run_amino_json"`
	MsgRunAnyJSON      json.RawMessage `json:"msg_run_any_json"`
	StdSignDocJSON     json.RawMessage `json:"std_sign_doc_json"`
	SignBytesString    string          `json:"sign_bytes_string"`
	SignBytesHex       string          `json:"sign_bytes_hex"`
	SignBytesSHA256Hex string          `json:"sign_bytes_sha256_hex"`
	SignatureHex       string          `json:"signature_hex"`
	SignedTxJSON       json.RawMessage `json:"signed_tx_json"`
	TxBytesHex         string          `json:"tx_bytes_hex"`
	TxHashSHA256Hex    string          `json:"tx_hash_sha256_hex"`
}

func main() {
	if err := run(); err != nil {
		panic(err)
	}
}

func run() error {
	fx, signBytes, signedTx, err := buildFixture()
	if err != nil {
		return err
	}

	return writeFixtureFiles(fx, signBytes, signedTx)
}

func buildFixture() (fixture, []byte, std.Tx, error) {
	priv, err := privateKey()
	if err != nil {
		return fixture{}, nil, std.Tx{}, err
	}

	pub := priv.PubKey()
	addr := pub.Address()
	msg := vm.MsgRun{
		Caller: addr,
		Package: &std.MemPackage{
			Name: "main",
			Path: "",
			Files: []*std.MemFile{
				{Name: "main.gno", Body: mainGno},
			},
		},
		Send:       nil,
		MaxDeposit: nil,
	}
	fee := std.NewFee(gasWanted, std.NewCoin("ugnot", 1000000))
	unsignedTx := std.NewTx([]std.Msg{msg}, fee, nil, memo)
	signDoc := std.SignDoc{
		ChainID:       chainID,
		AccountNumber: accountNumber,
		Sequence:      sequence,
		Fee:           fee,
		Msgs:          unsignedTx.Msgs,
		Memo:          unsignedTx.Memo,
	}

	signBytes, err := std.GetSignaturePayload(signDoc)
	if err != nil {
		return fixture{}, nil, std.Tx{}, err
	}
	sig, err := priv.Sign(signBytes)
	if err != nil {
		return fixture{}, nil, std.Tx{}, err
	}
	signedTx := std.NewTx(unsignedTx.Msgs, fee, []std.Signature{
		{PubKey: pub, Signature: sig},
	}, memo)
	txBytes, err := amino.Marshal(signedTx)
	if err != nil {
		return fixture{}, nil, std.Tx{}, err
	}

	fx := fixture{
		PrivateKeyHex:      privateKeyHex,
		Address:            addr.String(),
		AddressHex:         hex.EncodeToString(addr.Bytes()),
		PubKeyBech32:       crypto.PubKeyToBech32(pub),
		PubKeyHex:          hex.EncodeToString(pubKeyBytes(pub)),
		ChainID:            chainID,
		AccountNumber:      accountNumber,
		Sequence:           sequence,
		GasWanted:          gasWanted,
		GasFee:             fee.GasFee.String(),
		Memo:               memo,
		UnsignedTxJSON:     mustJSON(unsignedTx),
		MsgRunAminoJSON:    mustJSON(msg),
		MsgRunAnyJSON:      mustJSONAny(msg),
		StdSignDocJSON:     mustJSON(signDoc),
		SignBytesString:    string(signBytes),
		SignBytesHex:       hex.EncodeToString(signBytes),
		SignBytesSHA256Hex: sha256Hex(signBytes),
		SignatureHex:       hex.EncodeToString(sig),
		SignedTxJSON:       mustJSON(signedTx),
		TxBytesHex:         hex.EncodeToString(txBytes),
		TxHashSHA256Hex:    sha256Hex(txBytes),
	}

	return fx, signBytes, signedTx, nil
}

func writeFixtureFiles(fx fixture, signBytes []byte, signedTx std.Tx) error {
	if err := os.MkdirAll(outDir, 0o755); err != nil {
		return err
	}
	if err := writeJSON("fixture.json", fx); err != nil {
		return err
	}
	if err := writeBytes("sign_bytes.json", signBytes); err != nil {
		return err
	}
	if err := writeBytes("sign_bytes.hex", []byte(fx.SignBytesHex+"\n")); err != nil {
		return err
	}
	if err := writeBytes("signature.hex", []byte(fx.SignatureHex+"\n")); err != nil {
		return err
	}
	if err := writeBytes("tx_bytes.hex", []byte(fx.TxBytesHex+"\n")); err != nil {
		return err
	}
	if err := writeBytes("signed_tx.json", prettyJSON(signedTx)); err != nil {
		return err
	}

	fmt.Printf("wrote %s\n", outDir)
	fmt.Printf("address: %s\n", fx.Address)
	fmt.Printf("sign bytes sha256: %s\n", fx.SignBytesSHA256Hex)
	fmt.Printf("signature: %s\n", fx.SignatureHex)
	fmt.Printf("tx hash sha256: %s\n", fx.TxHashSHA256Hex)
	return nil
}

func privateKey() (secp256k1.PrivKeySecp256k1, error) {
	bz, err := hex.DecodeString(privateKeyHex)
	if err != nil {
		return secp256k1.PrivKeySecp256k1{}, err
	}
	if len(bz) != 32 {
		return secp256k1.PrivKeySecp256k1{}, fmt.Errorf("private key must be 32 bytes, got %d", len(bz))
	}
	var priv secp256k1.PrivKeySecp256k1
	copy(priv[:], bz)
	return priv, nil
}

func pubKeyBytes(pub crypto.PubKey) []byte {
	switch p := pub.(type) {
	case secp256k1.PubKeySecp256k1:
		return p[:]
	default:
		panic(fmt.Sprintf("unexpected pubkey type %T", pub))
	}
}

func mustJSON(v any) json.RawMessage {
	bz, err := amino.MarshalJSON(v)
	if err != nil {
		panic(err)
	}
	return append(json.RawMessage(nil), bz...)
}

func mustJSONAny(v any) json.RawMessage {
	bz, err := amino.MarshalJSONAny(v)
	if err != nil {
		panic(err)
	}
	return append(json.RawMessage(nil), bz...)
}

func prettyJSON(v any) []byte {
	raw := mustJSON(v)
	var decoded any
	if err := json.Unmarshal(raw, &decoded); err != nil {
		panic(err)
	}
	bz, err := json.MarshalIndent(decoded, "", "  ")
	if err != nil {
		panic(err)
	}
	return append(bz, '\n')
}

func writeJSON(name string, v any) error {
	bz, err := json.MarshalIndent(v, "", "  ")
	if err != nil {
		return err
	}
	return writeBytes(name, append(bz, '\n'))
}

func writeBytes(name string, bz []byte) error {
	return os.WriteFile(filepath.Join(outDir, name), bz, 0o644)
}

func sha256Hex(bz []byte) string {
	sum := sha256.Sum256(bz)
	return hex.EncodeToString(sum[:])
}
