const std = @import("std");
const expect = @import("std").testing.expect;
pub fn main() !void {
    std.debug.print("Hello, Enums!\n", .{});
    const Direction = enum {
        North,
        South,
        East,
        West,
    };

    const d = Direction.East;
    std.debug.print("Direction: {}\n", .{d});
}

const Value = enum(u2) { zero, one, two };
test "enum ordinal value" {
    try expect(@intFromEnum(Value.zero) == 0);
    try expect(@intFromEnum(Value.one) == 1);
    try expect(@intFromEnum(Value.two) == 2);
}

// values can be overridden,with the next values continuing from there
const Value2 = enum(u32) {
    hundred = 100,
    thousand = 1000,
    million = 1000000,
    next,
};

test "set enum ordinal value" {
    try expect(@intFromEnum(Value2.hundred) == 100);
    try expect(@intFromEnum(Value2.thousand) == 1000);
    try expect(@intFromEnum(Value2.million) == 1000000);
    try expect(@intFromEnum(Value2.next) == 1000001);
}
