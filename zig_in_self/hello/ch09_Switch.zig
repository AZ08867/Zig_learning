const expect = @import("std").testing.expect;

test "switch statement" {
    var x: i32 = 144;
    switch (x) {
        -1...1 => {
            x = -x;
        },
        10...100 => {
            x = 100 - x;
        },
        else => {
            x = @divExact(x, 12);
        },
    }
    try expect(x == 12);
}
