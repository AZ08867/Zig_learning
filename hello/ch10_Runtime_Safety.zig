const expect = @import("std").testing.expect;
test "out of bounds, no safety" {
    @setRuntimeSafety(false);
    const a = [3]u8{ 1, 2, 3 };
    var index: u8 = 5;
    const b = a[index];
    _ = b;
    _ = &index;
}

// unreachable

test "unreachable" {
    const x: i32 = 2;
    const y: u32 = if (x == 2) 5 else unreachable;
    _ = y;
}

// in switch

fn asciiToUpper(x: u8) u8 {
    return switch (x) {
        'a'...'z' => x + 'A' - 'a',
        'A'...'Z' => x,
        else => unreachable,
    };
}

test "unreachable switch" {
    try expect(asciiToUpper('a') == 'A');
    try expect(asciiToUpper('b') == 'B');
    try expect(asciiToUpper('A') == 'A');
}