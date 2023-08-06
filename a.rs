fn fib(i: u32) -> u32 {
    match i {
        0 => 0,
        1 => 1,
        _ => fib(i - 1) + fib(i - 2),
    }
}

fn main() {
    let t = fib(10);
    println!("fib(10) = {}", t);
}
