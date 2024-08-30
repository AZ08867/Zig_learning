// Defer is used to execute a statement while exiting the current block.
const expect = @import("std").testing.expect;
test "defer" {
    var x: u8 = 42;
    {
        defer x += 8;
        try expect(x == 42);
    }
    try expect(x == 50);
}

// When there are multiple defers in a single block, they are executed in reverse order.

test "defer multiple" {
    var y: f32 = 12.0;
    {
        defer y *= 2.0;
        defer y /= 3.0;
    }
    try expect(y == 8.0);
}
