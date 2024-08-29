// 语法：(const|var) identifier[: type] = value
const std = @import("std");
pub fn main() !void {
    const constant: i32 = -42;
    var variable: u32 = 13;
    variable = 17;
    std.debug.print("constant: {}\n", .{constant});
    std.debug.print("variable: {}\n", .{variable});

    // @as performs an explicit type coercion
    const inferred_constant = @as(i32, 5);
    var inferred_variable = @as(u32, 19);
    inferred_variable = @as(u32, 23);
    std.debug.print("inferred_constant: {}\n", .{inferred_constant});
    std.debug.print("inferred_variable: {}\n", .{inferred_variable});

    // 常量和变量必须具有值。如果无法给出已知值，则只要提供类型注释，就可以使用强制转换为任何类型的 undefined 值。
    // const a: i32 = undefined;
    // var b: u32 = undefined;
}
