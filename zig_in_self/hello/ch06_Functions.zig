// 变量的命名采用 snake_case 命名方式
// 函数命名采用 camelCase 命名方式

const expect = @import("std").testing.expect;

fn addFive(x: u32) u32 {
    return x + 5;
}

fn fibonacci(n: u32) u32 {
    if (n == 0 or n == 1) {
        return n;
    } else {
        return fibonacci(n - 1) + fibonacci(n - 2);
    }
}
test "functions" {
    const y = addFive(10);
    try expect(y == 15);
    try expect(@TypeOf(y) == u32);
}

test "fibonacci" {
    const y = fibonacci(10);
    try expect(y == 55);
    try expect(@TypeOf(y) == u32);
}
