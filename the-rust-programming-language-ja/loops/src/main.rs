//use std::io::Bytes;

fn main() {
    println!("Hello, world!");

    // let mut x = 0;
    // loop {
    //     println!("x = {}", x);
    //     x = x + 1;
    //     if x == 10 {
    //         panic!("the end");
    //     }
    // }

    let mut x = 5;
    let mut done = false;
    while !done {
        x += x - 3;
        println!("{}", x);
        if x % 5 == 0 {
            done = true;
        }
    }

    for i in 0..10 {
        println!("{}", i);
    }
    // println!("{}", i); // error: unresolved name `i`. Did you mean `x`? [E0425]

    for (index, item) in (5..10).enumerate() {
        println!("{} {}", index, item);
    }

    // let a = [0, 1, 2, 3, 4];
    // for (index, elem) in a.enumerate() { // なぜかうまくいかない
    //     println!("{}: {}", index, elem);
    // }


    let mut x = 5;
    loop {
        x += x - 3;
        println!("{}", x);
        // break if x % 5 == 0;
        if x % 5 == 0 { break } // break; でもいいし {}; でもいい
    }

    for x in 0..10 {
        if x % 2 == 0 { continue; }
        println!("{}", x);
    }

    println!("====");

    'outer: for x in 0..10 {
        'inner: for y in 0..10 {
            if x % 2 == 0 { continue; }
            if x % 7 == 0 { break 'outer; }
            if y % 2 == 0 { continue; }
            println!("{} {}", x, y);
        }
    }
}
