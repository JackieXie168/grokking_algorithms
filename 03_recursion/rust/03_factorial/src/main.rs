fn fact(x: u32) -> u32 {
    if x == 1 {
        return 1;
    }

    return x * fact(x - 1);
}

fn main() {
    println!("{}", fact(3));
}