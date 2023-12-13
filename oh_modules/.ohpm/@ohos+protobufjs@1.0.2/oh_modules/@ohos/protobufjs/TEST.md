﻿## protobuf单元测试用例

该测试用例基于OpenHarmony系统下，采用[原库测试用例](https://github.com/protobufjs/protobuf.js/tree/5.0.3/tests) 进行单元测试

**单元测试用例覆盖情况**

### protobufjs

| 接口名                             | 是否通过 | 备注 |
|---------------------------------| -------- | ---- |
| Util.fetch                      | pass     |      |
| Util.toCamelCase                | pass     |      |
| DotProto.Parser                 | pass     |      |
| Parser.parse                    | pass     |      |
| parser.parse                    | pass     |      |
| DotProto.Tokenizer              | pass     |      |
| Tokenizer.next                  | pass     |      |
| Tokenizer.peek                  | pass     |      |
| Tokenizer.toString              | pass     |      |
| Reflect.T.fqn                   | pass     |      |
| Reflect.Namespace.getChildren   | pass     |      |
| Reflect.Namespace.getChild      | pass     |      |
| Reflect.Message.encode          | pass     |      |
| message.encode                  | pass     |      |
| message.encodeDelimited         | pass     |      |
| message.encodeAB                | pass     |      |
| message.toArrayBuffer           | pass     |      |
| message.encodeNB                | pass     |      |
| message.toBuffer                | pass     |      |
| message.encode64                | pass     |      |
| message.toBase64                | pass     |      |
| message.encodeHex               | pass     |      |
| message.toHex                   | pass     |      |
| message.toRaw                   | pass     |      |
| message.encodeJSON              | pass     |      |
| message.calculate               | pass     |      |
| Reflect.Message.decodeDelimited | pass     |      |
| Reflect.Message.decode          | pass     |      |
| Reflect.Message.decode64        | pass     |      |
| Reflect.Message.decodeHex       | pass     |      |
| Reflect.Message.decodeJSON      | pass     |      |
| Builder.isMessage               | pass     |      |
| Builder.isMessageField          | pass     |      |
| Builder.isEnum                  | pass     |      |
| Builder.isService               | pass     |      |
| Builder.isExtend                | pass     |      |
| Builder.build                   | pass     |      |
| Builder.lookup                  | pass     |      |
| Map.clear                       | pass     |      |
| Map.delete                      | pass     |      |
| Map.entries                     | pass     |      |
| Map.keys                        | pass     |      |
| Map.values                      | pass     |      |
| Map.set                         | pass     |      |
| Map.get                         | pass     |      |
| Map.has                         | pass     |      |
| Map.forEach                     | pass     |      |
| loadProto                       | pass     |      |
| protoFromString                 | pass     |      |
| loadProtoFile                   | pass     |      |
| protoFromFile                   | pass     |      |
| newBuilder                      | pass     |      |
| loadJson                        | pass     |      |
| loadJsonFile                    | pass     |      |

### long

| 接口名              | 是否通过 | 备注 |
| ------------------- |------| ---- |
| constructor         | pass |      |
| fromBits            | pass |      |
| fromInt             | pass |      |
| fromNumber          | pass |      |
| fromString          | pass |      |
| fromBytes           | pass |      |
| fromBytesLE         | pass |      |
| fromBytesBE         | pass |      |
| isLong              | pass |      |
| fromValue           | pass |      |
| add                 | pass |      |
| and                 | pass |      |
| compare             | pass |      |
| comp                | pass |      |
| divide              | pass |      |
| div                 | pass |      |
| equals              | pass |      |
| eq                  | pass |      |
| getHighBits         | pass |      |
| getHighBitsUnsigned | pass |      |
| getLowBits          | pass |      |
| getLowBitsUnsigned  | pass |      |
| getNumBitsAbs       | pass |      |
| greaterThan         | pass |      |
| gt                  | pass |      |
| greaterThanOrEqual  | pass |      |
| gte                 | pass |      |
| ge                  | pass |      |
| isEven              | pass |      |
| isNegative          | pass |      |
| isOdd               | pass |      |
| isPositive          | pass |      |
| isZero              | pass |      |
| eqz                 | pass |      |
| lessThan            | pass |      |
| lt                  | pass |      |
| lessThanOrEqual     | pass |      |
| lte                 | pass |      |
| le                  | pass |      |
| modulo              | pass |      |
| mod                 | pass |      |
| rem                 | pass |      |
| multiply            | pass |      |
| mul                 | pass |      |
| negate              | pass |      |
| neg                 | pass |      |
| not                 | pass |      |
| countLeadingZeros   | pass |      |
| clz                 | pass |      |
| countTrailingZeros  | pass |      |
| ctz                 | pass |      |
| notEquals           | pass |      |
| neq                 | pass |      |
| ne                  | pass |      |
| or                  | pass |      |
| shiftLeft           | pass |      |
| shl                 | pass |      |
| shiftRight          | pass |      |
| shr                 | pass |      |
| shiftRightUnsigned  | pass |      |
| shru                | pass |      |
| shr_u               | pass |      |
| rotateLeft          | pass |      |
| rotl                | pass |      |
| rotateRight         | pass |      |
| rotr                | pass |      |
| subtract            | pass |      |
| sub                 | pass |      |
| toInt               | pass |      |
| toNumber            | pass |      |
| toBytes             | pass |      |
| toBytesLE           | pass |      |
| toBytesBE           | pass |      |
| toSigned            | pass |      |
| toString            | pass |      |
| toUnsigned          | pass |      |
| xor                 | pass |      |

### bytebuffer

| 接口名              | 是否通过 | 备注 |
| ------------------- | -------- | ---- |
| contructor          | pass     |      |
| accessor            | pass     |      |
| allocate            | pass     |      |
| concat              | pass     |      |
| isByteBuffer        | pass     |      |
| type                | pass     |      |
| wrap                | pass     |      |
| writeBitSet         | pass     |      |
| readBitSet          | pass     |      |
| readBytes           | pass     |      |
| append              | pass     |      |
| writeInt8           | pass     |      |
| writeByte           | pass     |      |
| readInt8            | pass     |      |
| readByte            | pass     |      |
| writeUint8          | pass     |      |
| writeUInt8          | pass     |      |
| readUint8           | pass     |      |
| readUInt8           | pass     |      |
| writeInt16          | pass     |      |
| writeShort          | pass     |      |
| readInt16           | pass     |      |
| readShort           | pass     |      |
| writeUint16         | pass     |      |
| writeUInt16         | pass     |      |
| readUint16          | pass     |      |
| readUInt16          | pass     |      |
| writeInt32          | pass     |      |
| writeInt            | pass     |      |
| readInt32           | pass     |      |
| readInt             | pass     |      |
| writeUint32         | pass     |      |
| writeUInt32         | pass     |      |
| readUint32          | pass     |      |
| readUInt32          | pass     |      |
| writeInt64          | pass     |      |
| writeLong           | pass     |      |
| readInt64           | pass     |      |
| readLong            | pass     |      |
| writeUint64         | pass     |      |
| writeUInt64         | pass     |      |
| readUint64          | pass     |      |
| readUInt64          | pass     |      |
| writeFloat32        | pass     |      |
| writeFloat          | pass     |      |
| readFloat32         | pass     |      |
| readFloat           | pass     |      |
| writeFloat64        | pass     |      |
| writeDouble         | pass     |      |
| readFloat64         | pass     |      |
| readDouble          | pass     |      |
| calculateVarint32   | pass     |      |
| zigZagEncode32      | pass     |      |
| zigZagDecode32      | pass     |      |
| writeVarint32       | pass     |      |
| writeVarint32ZigZag | pass     |      |
| readVarint32        | pass     |      |
| readVarint32ZigZag  | pass     |      |
| calculateVarint64   | pass     |      |
| zigZagEncode64      | pass     |      |
| zigZagDecode64      | pass     |      |
| writeVarint64       | pass     |      |
| writeVarint64ZigZag | pass     |      |
| readVarint64        | pass     |      |
| readVarint64ZigZag  | pass     |      |
| writeCString        | pass     |      |
| readCString         | pass     |      |
| writeIString        | pass     |      |
| readIString         | pass     |      |
| writeUTF8String     | pass     |      |
| writeString         | pass     |      |
| calculateUTF8Chars  | pass     |      |
| calculateUTF8Bytes  | pass     |      |
| calculateString     | pass     |      |
| readUTF8String      | pass     |      |
| readString          | pass     |      |
| writeVString        | pass     |      |
| readVString         | pass     |      |
| append              | pass     |      |
| appendTo            | pass     |      |
| assert              | pass     |      |
| capacity            | pass     |      |
| clear               | pass     |      |
| clone               | pass     |      |
| compact             | pass     |      |
| copy                | pass     |      |
| copyTo              | pass     |      |
| ensureCapacity      | pass     |      |
| fill                | pass     |      |
| flip                | pass     |      |
| mark                | pass     |      |
| order               | pass     |      |
| LE                  | pass     |      |
| BE                  | pass     |      |
| prepend             | pass     |      |
| prependTo           | pass     |      |
| printDebug          | pass     |      |
| remaining           | pass     |      |
| reset               | pass     |      |
| resize              | pass     |      |
| reverse             | pass     |      |
| skip                | pass     |      |
| slice               | pass     |      |
| toBuffer            | pass     |      |
| toArrayBuffer       | pass     |      |
| toString            | pass     |      |
| toBase64            | pass     |      |
| fromBase64          | pass     |      |
| btoa                | pass     |      |
| atob                | pass     |      |
| toBinary            | pass     |      |
| fromBinary          | pass     |      |
| toDebug             | pass     |      |
| fromDebug           | pass     |      |
| toHex               | pass     |      |
| fromHex             | pass     |      |
| toUTF8              | pass     |      |
| fromUTF8            | pass     |      |
