const std = @import("std");

// 使用 if 完成
// pub fn main() !void {
//     const stdout = std.io.getStdOut().writer();
//     var count: u8 = 1;
//     while (count <= 100) : (count += 1) {
//         // try stdout.print("{}\n",.{count});
//         if (count % 3 == 0 and count % 5 == 0) {
//             try stdout.print("FizzBuzz\n", .{});
//         } else if (count % 3 == 0) {
//             try stdout.print("Fizz\n", .{});
//         } else if (count % 5 == 0) {
//             try stdout.print("Buzz\n", .{});
//         } else {
//             try stdout.print("{}\n", .{count});
//         }
//     }
// }

// 使用 switch 完成
pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    var count: u8 = 1;
    while (count <= 100) : (count += 1) {
        const div_3: u2 = @intFromBool(count % 3 == 0);
        const div_5 = @intFromBool(count % 5 == 0);

        switch (div_3 * 2 + div_5) {
            0b10 => try stdout.print("Fizz\n", .{}),
            0b01 => try stdout.print("Buzz\n", .{}),
            0b11 => try stdout.print("FizzBuzz\n", .{}),
            else => try stdout.print("{}\n", .{count}),
        }
    }
    // We can rewrite the switch value to use bitwise operations. This is equivalent to the operation performed above.
    // switch (div_3 << 1 | div_5) {...}
}
