"""Repack Lua 5.1 x86 bytecode strings for an x64 Lua 5.1 reader.

Only the size_t width changes (4 -> 8). This is a structural transform for
research and never alters the extracted bytecode files themselves.
"""

from __future__ import annotations

import argparse
import struct
from pathlib import Path


class Reader:
    def __init__(self, data: bytes) -> None:
        self.data = data
        self.pos = 0

    def take(self, length: int) -> bytes:
        end = self.pos + length
        if end > len(self.data):
            raise ValueError(f"Truncated Lua chunk at offset {self.pos}")
        result = self.data[self.pos:end]
        self.pos = end
        return result

    def uint(self) -> int:
        return struct.unpack("<I", self.take(4))[0]


def repack(data: bytes) -> bytes:
    reader = Reader(data)
    header = bytearray(reader.take(12))
    if header[:9] != b"\x1bLua\x51\x00\x01\x04\x04" or header[9:] != b"\x04\x08\x00":
        raise ValueError(f"Expected little-endian Lua 5.1 with 32-bit size_t: {header.hex()}")
    header[8] = 8
    output = bytearray(header)

    def lua_string() -> None:
        length = reader.uint()
        output.extend(struct.pack("<Q", length))
        output.extend(reader.take(length))

    def prototype() -> None:
        lua_string()  # source name
        output.extend(reader.take(12))  # line numbers and function signature
        count = reader.uint()
        output.extend(struct.pack("<I", count))
        output.extend(reader.take(count * 4))
        count = reader.uint()
        output.extend(struct.pack("<I", count))
        for _ in range(count):
            kind = reader.take(1)
            output.extend(kind)
            if kind == b"\x00":
                pass
            elif kind == b"\x01":
                output.extend(reader.take(1))
            elif kind == b"\x03":
                output.extend(reader.take(8))
            elif kind == b"\x04":
                lua_string()
            else:
                raise ValueError(f"Unsupported constant type {kind.hex()}")
        count = reader.uint()
        output.extend(struct.pack("<I", count))
        for _ in range(count):
            prototype()
        count = reader.uint()
        output.extend(struct.pack("<I", count))
        output.extend(reader.take(count * 4))
        count = reader.uint()
        output.extend(struct.pack("<I", count))
        for _ in range(count):
            lua_string()
            output.extend(reader.take(8))
        count = reader.uint()
        output.extend(struct.pack("<I", count))
        for _ in range(count):
            lua_string()

    prototype()
    if reader.pos != len(data):
        raise ValueError(f"Trailing bytes after Lua chunk: {len(data) - reader.pos}")
    return bytes(output)


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("source", type=Path)
    parser.add_argument("output", type=Path)
    args = parser.parse_args()
    args.output.write_bytes(repack(args.source.read_bytes()))
