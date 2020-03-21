fn countdown(i: u32) {
    println!("{}", i);
    if i == 0 {
        return
    }

   countdown(i - 1);
}

fn main() {
    countdown(5);
}
