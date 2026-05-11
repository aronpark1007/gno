// Copyright 2017 Tendermint. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package amino_test

import (
	"encoding/hex"
	"fmt"
	"reflect"

	amino "github.com/gnolang/gno/tm2/pkg/amino"
	"github.com/gnolang/gno/tm2/pkg/crypto"
	"github.com/gnolang/gno/tm2/pkg/crypto/ed25519"
)

func Example() {
	type Message any

	type bcMessage struct {
		Message string
		Height  int
	}

	type bcResponse struct {
		Status  int
		Message string
	}

	type bcStatus struct {
		Peers int
	}

	// amino.RegisterPackage registers globally.
	amino.RegisterPackage(
		amino.NewPackage(
			reflect.TypeOf(bcMessage{}).PkgPath(),
			"amino_test",
			amino.GetCallersDirname(),
		).
			WithTypes(&bcMessage{}, &bcResponse{}, &bcStatus{}),
	)

	bm := &bcMessage{Message: "ABC", Height: 100}
	msg := bm

	var bz []byte // the marshalled bytes.
	var err error
	bz, err = amino.MarshalAnySized(msg)
	fmt.Printf("Encoded: %X (err: %v)\n", bz, err)

	var msg2 Message
	err = amino.UnmarshalSized(bz, &msg2)
	fmt.Printf("Decoded: %v (err: %v)\n", msg2, err)
	bm2 := msg2.(*bcMessage)
	fmt.Printf("Decoded successfully: %v\n", *bm == *bm2)

	// Output:
	// Encoded: 210A152F616D696E6F5F746573742E62634D65737361676512080A0341424310C801 (err: <nil>)
	// Decoded: &{ABC 100} (err: <nil>)
	// Decoded successfully: true
}

func Example_cryptoPubKeyEncoding() {
	var raw [ed25519.PubKeyEd25519Size]byte
	for i := range raw {
		raw[i] = byte(i + 1)
	}

	pubKey := ed25519.PubKeyEd25519(raw)
	votingPower := int64(10)

	// This is the same anonymous struct shape used by Validator.Bytes().
	validatorHashInput := struct {
		PubKey      crypto.PubKey
		VotingPower int64
	}{
		pubKey,
		votingPower,
	}

	concretePubKey := amino.MustMarshal(pubKey)
	anyPubKey := amino.MustMarshalAny(pubKey)
	validatorBytes := amino.MustMarshal(validatorHashInput)

	fmt.Printf("type URL: %s\n", amino.GetTypeURL(pubKey))
	fmt.Printf("raw pubkey: %s\n", hex.EncodeToString(pubKey[:]))
	fmt.Printf("concrete PubKeyEd25519: %s\n", hex.EncodeToString(concretePubKey))
	fmt.Printf("crypto.PubKey as Any: %s\n", hex.EncodeToString(anyPubKey))
	fmt.Printf("validator hash input: %s\n", hex.EncodeToString(validatorBytes))
	fmt.Println()
	fmt.Println("field key = (field_number << 3) | wire_type")
	fmt.Println("wire types: varint = 0, bytes = 2")
	fmt.Println()
	fmt.Println("concrete PubKeyEd25519:")
	fmt.Println("  0a = field 1, bytes")
	fmt.Println("  20 = length 32")
	fmt.Println("  <32 raw pubkey bytes>")
	fmt.Println()
	fmt.Println("crypto.PubKey Any wrapper:")
	fmt.Println("  0a 11 = Any field 1 type_url, length 17")
	fmt.Println("  2f746d2e5075624b657945643235353139 = /tm.PubKeyEd25519")
	fmt.Println("  12 22 = Any field 2 value, length 34")
	fmt.Println("  0a 20 <32 raw pubkey bytes> = concrete value")
	fmt.Println()
	fmt.Println("Validator.Bytes() hash input:")
	fmt.Println("  0a 37 = outer field 1 PubKey, length 55")
	fmt.Println("  <Any wrapper bytes>")
	fmt.Println("  10 14 = outer field 2 VotingPower, signed varint 10")

	// Output:
	// type URL: /tm.PubKeyEd25519
	// raw pubkey: 0102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f20
	// concrete PubKeyEd25519: 0a200102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f20
	// crypto.PubKey as Any: 0a112f746d2e5075624b65794564323535313912220a200102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f20
	// validator hash input: 0a370a112f746d2e5075624b65794564323535313912220a200102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f201014
	//
	// field key = (field_number << 3) | wire_type
	// wire types: varint = 0, bytes = 2
	//
	// concrete PubKeyEd25519:
	//   0a = field 1, bytes
	//   20 = length 32
	//   <32 raw pubkey bytes>
	//
	// crypto.PubKey Any wrapper:
	//   0a 11 = Any field 1 type_url, length 17
	//   2f746d2e5075624b657945643235353139 = /tm.PubKeyEd25519
	//   12 22 = Any field 2 value, length 34
	//   0a 20 <32 raw pubkey bytes> = concrete value
	//
	// Validator.Bytes() hash input:
	//   0a 37 = outer field 1 PubKey, length 55
	//   <Any wrapper bytes>
	//   10 14 = outer field 2 VotingPower, signed varint 10
}
