fn fib(i: i32) -> i32 {
    return if i == 0 { 0 } else if i == 1 { 1 } else { fib(i - 1) + fib(i - 2) }
}

fn main() {
    println!("{}", fib(10));
    return;
    println!("Hello, world!");
}
