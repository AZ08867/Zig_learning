const expect = @import("std").testing.expect;
// Referencing is done with &variable, and dereferencing is done with variable.*.
// normal pointers in zig cannot have 0 or null values.
fn increment(ptr: *i32) void {
    ptr.* += 1;
}

test "pointers" {
    var x: i32 = 1234;
    increment(&x);
    try expect(x == 1235);
}
// zig also has const pointers.
test "const pointers" {
    const x: i32 = 42;
    const y = &x;
    // y.* += 1;
    try expect(y.* == 42);
}