fn main() {
    print_number(3);
    print_number(4);

    print_sum(4, 2);

    // let x = (let y = 3);

    // let mut y = 5;

    // let x = (y = 6);  // x has the value `()`, not `6`

    // println!("y = {}.", y);
    // println!("x = {}.", x);

    println!("1 + {} = {}.", 3, add_one(3));

    // diverges();

    // let z: i32 = diverges();
    // println!("z is {}.", z);

    // let z: String = diverges();


    // let f: fn(i32) -> i32;

    let f: fn(i32) -> i32 = plus_one;
    println!("{}", f(1));

    let f2 = plus_one;
    println!("{}", f2(1));
}

fn plus_one(i: i32) -> i32 {
    i + 1
}

// fn foo() {
    
// }

fn print_number(x: i32) {
    println!("x is {}.", x);
}

fn print_sum(x: i32, y: i32) {
    println!("sum is {}.", x + y);
}

// fn print_sum2(x, y) {
//     println!("sum is {}.", x + y);
// }

fn add_one(x: i32) -> i32 {
    // return x;
    return x + 1;
}

fn diverges() -> ! {
    panic!("hogehoge");
}
