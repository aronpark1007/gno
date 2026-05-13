# Gno Amino Signing Fixture

This tool generates byte-level fixtures for a Gno `MsgRun` transaction using
Gno's native signing path.

It is intended for non-Go clients, such as Rust relayers, that need to reproduce
Gno transaction signing byte-for-byte.

The signing formula is:

```text
sign_bytes = sortJSON(aminoJSON(std.SignDoc))
signature = secp256k1.sign(sign_bytes)
```

The broadcast bytes are:

```text
amino.Marshal(signed std.Tx)
```

## Generate

From this directory:

```sh
go run .
```

The checked-in fixture is under `testdata/msg_run_basic/`.

The generator uses the actual Gno types and helpers:

- `gno.land/pkg/sdk/vm.MsgRun`
- `tm2/pkg/std.SignDoc`
- `tm2/pkg/std.GetSignaturePayload`
- `tm2/pkg/std.Tx`
- `tm2/pkg/amino`
- `tm2/pkg/crypto/secp256k1`

## Fixture Values

- private key: `4e9444a6efd6d42725a250b650a781da2737ea308c839eaccb0f7f3dbd2fea77`
- address: `g14sarpj4p7l68eze5shfx4xtxr7vl92gejxfdw4`
- compressed public key: `024c53721dcd3b246a74dd892ca0fb9d747bddb3e82abe3384ccd6b41b7540de4d`
- chain ID: `dev`
- account number: `7`
- sequence: `3`
- fee: `1000000ugnot`
- gas wanted: `5000000`
- memo: `gno amino fixture`
- sign bytes SHA-256: `44a195d3d2a2dcec1592d610712d2937e2af698c933cc450a1e84699702896c1`
- tx bytes SHA-256: `d76f0ad1a2e0b9a7b17831e269b11e1fa6145ccb9d197e065e14f2fcaea36c4f`

Use `fixture.json` for the complete structured output. The smaller files are
split out for Rust or other clients that want direct byte-for-byte assertions:

- `sign_bytes.json`: exact bytes passed to `PrivKeySecp256k1.Sign`
- `sign_bytes.hex`: hex encoding of `sign_bytes.json`
- `signature.hex`: `R || S` secp256k1 signature over the sign bytes
- `signed_tx.json`: amino JSON representation of the signed transaction
- `tx_bytes.hex`: amino binary encoding of the signed transaction for broadcast

The fixture intentionally uses `MsgRun`, because Gno IBC calls often need to pass
complex arguments that do not fit cleanly through `MsgCall`.

## Transaction Flow

The fixture follows the same shape as `gnokey maketx run`:

1. Build a `vm.MsgRun`.
2. Put the message into an unsigned `std.Tx`.
3. Build a `std.SignDoc` from `chain_id`, `account_number`, `sequence`,
   `tx.Fee`, `tx.Msgs`, and `tx.Memo`.
4. Generate canonical sign bytes with `std.GetSignaturePayload(signDoc)`.
5. Sign those bytes with `secp256k1.PrivKeySecp256k1.Sign`.
6. Attach `std.Signature{PubKey, Signature}` to the `std.Tx`.
7. Encode the signed transaction with `amino.Marshal(signedTx)`.
8. Submit those amino binary bytes to the Gno RPC broadcast endpoint.

`std.SignDoc` is not broadcast. It is only the replay-protected document that is
signed. The broadcast payload is the signed `std.Tx`.

## Sign Bytes Details

`std.GetSignaturePayload` is implemented as:

```go
data, err := amino.MarshalJSON(signDoc)
signBytes, err := sortJSON(data)
```

`sortJSON` parses the amino JSON and marshals it back with Go's standard
`encoding/json`. The resulting bytes are compact JSON with object keys sorted by
Go's JSON encoder. Whitespace and original struct field order are not preserved.

The exact bytes signed in this fixture are in:

```text
testdata/msg_run_basic/sign_bytes.json
```

Its hex encoding is in:

```text
testdata/msg_run_basic/sign_bytes.hex
```

## Amino JSON Rules To Match

Rust implementations should reproduce these details exactly:

- `vm.MsgRun` inside `std.SignDoc.Msgs` is encoded as an amino Any object with
  `@type: "/vm.m_run"`.
- The secp256k1 public key in the signed tx is encoded as
  `@type: "/tm.PubKeySecp256k1"`.
- `account_number`, `sequence`, and `gas_wanted` are JSON strings, not JSON
  numbers.
- `std.Coin` and `std.Coins` use amino custom JSON strings:
  `gas_fee: "1000000ugnot"`, `send: ""`, and `max_deposit: ""`.
- Empty `std.Coins` becomes the empty string `""`.
- `MsgRun.Package.Path` is the empty string for run transactions; the VM keeper
  assigns the reserved run path during execution.
- `signed_tx.json` is only a readable representation. The bytes sent to RPC are
  `amino.Marshal(signedTx)`, provided as `tx_bytes.hex`.

## Signature Details

`secp256k1.PrivKeySecp256k1.Sign` hashes the sign bytes with SHA-256 before
signing:

```text
ecdsa_message = sha256(sign_bytes)
```

The signature bytes are 64 bytes:

```text
R || S
```

They are not DER encoded and do not include a recovery ID. The implementation
uses a lower-S signature. The expected signature is in `signature.hex`.

## Rust Implementation Checklist

- Build the amino JSON form of `std.SignDoc`, not a protobuf `SignDoc`.
- Encode `MsgRun` as amino Any with `@type: "/vm.m_run"`.
- Encode integer fields as strings where Gno amino JSON does so.
- Encode `Coin` and `Coins` as strings.
- Canonicalize the amino JSON into the exact compact sorted JSON sign bytes.
- Sign `sha256(sign_bytes)` with secp256k1 and output `R || S`.
- Add the signature and `/tm.PubKeySecp256k1` public key to `std.Tx`.
- Amino-binary encode the signed `std.Tx` for broadcast.
- Assert against `sign_bytes.hex`, `signature.hex`, and `tx_bytes.hex`.
