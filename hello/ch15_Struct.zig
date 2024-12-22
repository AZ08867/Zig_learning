const expect = @import("std").testing.expect;
const Vector3 = struct { x: f32, y: f32, z: f32 };
test "struct usage" {
    const my_vector = Vector3{
        .x = 1.0,
        .y = 2.0,
        .z = 3.0,
    };
    _ = my_vector;
}
