import Long from 'long';

declare class ByteBuffer {
  constructor(capacity?: number, littleEndian?: boolean, noAssert?: boolean);

  static VERSION: number;

  static LITTLE_ENDIAN: boolean;

  static BIG_ENDIAN: boolean;

  static DEFAULT_CAPACITY: number;

  static DEFAULT_ENDIAN: number;

  static DEFAULT_NOASSERT: boolean;

  static MAX_VARINT32_BYTES: number;

  static MAX_VARINT64_BYTES: number;

  static METRICS_CHARS: string;

  static METRICS_BYTES: string;

  static Long: Long;

  __isByteBuffer__;

  static accessor(): Uint8Array;

  static allocate(capacity?: number, littleEndian?: Boolean, noAssert?: Boolean): ByteBuffer;

  static concat(buffers: (ByteBuffer | ArrayBuffer | Uint8Array | string)[], encoding?: String | Boolean, littleEndian?: Boolean, noAssert?: Boolean): ByteBuffer;

  static isByteBuffer(bb: any): ByteBuffer;

  static type(): ArrayBuffer;

  static wrap(buffer: ByteBuffer | ArrayBuffer | Uint8Array | string | number[], encoding?: String | Boolean, littleEndian?: Boolean, noAssert?: Boolean): ByteBuffer;

  static calculateVarint32(value: number): number;

  static zigZagEncode32(value: number): number;

  static zigZagDecode32(value: number): number;

  static calculateVarint64(value: number | Long): number;

  static zigZagEncode64(value: number | Long): Long;

  static zigZagDecode64(value: number | Long): Long;

  static calculateUTF8Chars(str: string): number;

  static calculateUTF8Bytes(str: string): number;

  static calculateString(str: string): number;

  static fromBase64(str: string, littleEndian?: Boolean): ByteBuffer;

  static btoa(str: string): string;

  static atob(base64Str: string): string;

  static fromBinary(str: string, littleEndian?: Boolean): ByteBuffer;

  static fromDebug(str: string, littleEndian?: Boolean, noAssert?: Boolean): ByteBuffer;

  static fromHex(str: string, littleEndian?: Boolean, noAssert?: Boolean): ByteBuffer;

  static fromUTF8(str: string, littleEndian?: Boolean, noAssert?: Boolean): ByteBuffer;

  buffer: ArrayBuffer;

  view: Uint8Array;

  markedOffset: number;

  offset: number;

  limit: number;

  littleEndian: Boolean;

  noAssert: Boolean;

  writeBitSet(value: Boolean[], offset?: number): ByteBuffer | number;

  readBitSet(offset?: number): Boolean[];

  readBytes(length: number, offset?: number): ByteBuffer;

  writeInt8(value: number, offset?: number): ByteBuffer;

  writeByte(value: number, offset?: number): ByteBuffer;

  readInt8(offset?: number): number;

  readByte(offset?: number): number;

  writeUint8(value: number, offset?: number): ByteBuffer;

  writeUInt8(value: number, offset?: number): ByteBuffer;

  readUint8(offset?: number): number;

  readUInt8(offset?: number): number;

  writeInt16(value: number, offset?: number): ByteBuffer;

  writeShort(value: number, offset?: number): ByteBuffer;

  readInt16(offset?: number): number;

  readShort(offset?: number): number;

  writeUint16(value: number, offset?: number): ByteBuffer;

  writeUInt16(value: number, offset?: number): ByteBuffer;

  readUint16(offset?: number): number;

  readUInt16(offset?: number): number;

  writeInt32(value: number, offset?: number): ByteBuffer;

  writeInt(value: number, offset?: number): ByteBuffer;

  readInt32(offset?: number): number;

  readInt(offset?: number): number;

  writeUint32(value: number, offset?: number): ByteBuffer;

  writeUInt32(value: number, offset?: number): ByteBuffer;

  readUint32(offset?: number): number;

  readUInt32(offset?: number): number;

  writeInt64(value: number, offset?: number): ByteBuffer;

  writeLong(value: number, offset?: number): ByteBuffer;

  readInt64(offset?: number): Long;

  readLong(offset?: number): Long;

  writeUint64(value: number, offset?: number): ByteBuffer;

  writeUInt64(value: number, offset?: number): ByteBuffer;

  readUint64(offset?: number): Long;

  readUInt64(offset?: number): Long;

  writeFloat32(value: number, offset?: number): ByteBuffer;

  writeFloat(value: number, offset?: number): ByteBuffer;

  readFloat32(offset?: number): number;

  readFloat(offset?: number): number;

  writeFloat64(value: number, offset?: number): ByteBuffer;

  writeDouble(value: number, offset?: number): ByteBuffer;

  readFloat64(offset?: number): number;

  readDouble(offset?: number): number;

  writeVarint32(value: number, offset?: number): ByteBuffer | number;

  writeVarint32ZigZag(value: number, offset?: number): ByteBuffer | number;

  readVarint32(offset?: number): number | {
    value: number,
    length: number
  };

  readVarint32ZigZag(offset?: number): number | {
    value: number,
    length: number
  };

  writeVarint64(value: number, offset?: number): ByteBuffer | number;

  writeVarint64ZigZag(value: number, offset?: number): ByteBuffer | number;

  readVarint64(offset?: number): Long | {
    value: Long,
    length: number
  };

  readVarint64ZigZag(offset?: number): Long | {
    value: Long,
    length: number
  };

  writeCString(str: string, offset?: number): ByteBuffer | number;

  readCString(offset?: number): string | {
    string: string,
    length: number
  };

  writeIString(str: string, offset?: number): ByteBuffer | number;

  readIString(offset?: number): string | {
    string: string,
    length: number
  };

  writeUTF8String(str: string, offset?: number): ByteBuffer | number;

  writeString(str: string, offset?: number): ByteBuffer | number;

  readUTF8String(length: number, metrics?: string, offset?: number): string | {
    string: string,
    length: number
  };

  readString(length: number, metrics?: string, offset?: number): string | {
    string: string,
    length: number
  };

  writeVString(str: string, offset?: number): ByteBuffer | number;

  readVString(offset?: number): string | {
    string: string,
    length: number
  };

  append(source: ByteBuffer | ArrayBuffer | Uint8Array | string, encoding?: string | number, offset?: number): ByteBuffer;

  appendTo(target: ByteBuffer, offset?: number): ByteBuffer;

  assert(assert: Boolean): ByteBuffer;

  capacity(): number;

  clear(): ByteBuffer;

  clone(copy?: Boolean): ByteBuffer;

  compact(begin?: number, end?: number): ByteBuffer;

  copy(begin?: number, end?: number): ByteBuffer;

  copyTo(target: ByteBuffer, targetOffset?: number, sourceOffset?: number, sourceLimit?: number): ByteBuffer;

  ensureCapacity(capacity: number): ByteBuffer

  fill(value: number | string, begin?: number, end?: number): ByteBuffer;

  flip(): ByteBuffer;

  mark(offset?: number): ByteBuffer;

  order(littleEndian: Boolean): ByteBuffer;

  LE(littleEndian?: Boolean): ByteBuffer;

  BE(bigEndian?: Boolean): ByteBuffer;

  prepend(source: ByteBuffer | string | ArrayBuffer, encoding?: string | number, offset?: number): ByteBuffer;

  prependTo(target: ByteBuffer, offset?: number): ByteBuffer;

  printDebug(out?: Function): void;

  remaining(): number;

  reset(): ByteBuffer;

  resize(capacity: number): ByteBuffer;

  reverse(begin?: number, end?: number): ByteBuffer;

  skip(length: number): ByteBuffer;

  slice(begin?: number, end?: number): ByteBuffer;

  toBuffer(forceCopy?: Boolean): ArrayBuffer;

  toArrayBuffer(forceCopy?: Boolean): ArrayBuffer;

  toString(encoding?: string, begin?: number, end?: number): string;

  toBase64(begin?: number, end?: number): string;

  toBinary(begin?: number, end?: number): string;

  toDebug(columns?: Boolean): string | string [];

  toHex(begin?: number, end?: number): string;

  toUTF8(begin?: number, end?: number): string;
}

export default ByteBuffer;
