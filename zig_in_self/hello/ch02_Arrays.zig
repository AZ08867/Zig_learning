const std = @import("std");

pub fn main() !void {
    const arr = [_]u8{ 'h', 'e', 'l', 'l', 'o' };
    const arr1 = [5]u8{ 'w', 'o', 'r', 'l', 'd' };
    std.debug.print("{s}\n", .{arr});
    std.debug.print("{s}\n", .{arr1});

    std.debug.print("{}\n", .{arr.len});
}
