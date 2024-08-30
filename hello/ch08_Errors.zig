// An error set is like an enum (details on Zig's enums later), where each error in the set is a value. There are no exceptions in Zig; errors are values. Let's create an error set.

const expect = @import("std").testing.expect;

const FileOpenError = error{
    AccessDenied,
    OutOfMemory,
    PathNotFound,
};
// Error sets coerce to their supersets.

const AllocationError = error{OutOfMemory};
test "coerce error from a subset to a superset" {
    const err = AllocationError.OutOfMemory;
    try expect(err == FileOpenError.OutOfMemory);
}

// An error set type and another type can be combined with the ! operator to form an error union type. Values of these types may be an error value or a value of the other type.
test "error union" {
    const maybe_error: AllocationError!u32 = 12;
    const no_error = maybe_error catch 42;

    try expect(no_error == 12);
    try expect(@TypeOf(no_error) == u32);
}

fn failingFunctiun() error{Oops}!void {
    return error.Oops;
}

test "returning an error" {
    failingFunctiun() catch |err| {
        try expect(err == error.Oops);
        return;
    };
}

// try x is a shortcut for x catch |err| return err, and is commonly used where handling an error isn't appropriate. Zig's try and catch are unrelated to try-catch in other languages.

fn failFn() error{Oop}!i32 {
    try failingFunctiun();
    return 12;
}

test "try" {
    const v = failFn() catch |err| {
        try expect(err == error.Oops);
        return;
    };
    try expect(v == 12); // is never reached
}

// errdefer works like defer, but only executing when the function is returned from with an error inside of the errdefer's block.

var problems: u32 = 98;

fn failFnCounter() error{Oops}!void {
    errdefer problems += 1;
    try failingFunctiun();
}

test "errdefer" {
    failFnCounter() catch |err| {
        try expect(err == error.Oops);
        try expect(problems == 99);
        return;
    };
}

fn createFile() !void {
    return error.AccessDenied;
}

test "inferred error set" {
    const x: error{AccessDenied}!void = createFile();
    //Zig does not let us ignore error unions via _ = x;
    //we must unwrap it with "try", "catch", or "if" by any means
    _ = x catch {};
}
