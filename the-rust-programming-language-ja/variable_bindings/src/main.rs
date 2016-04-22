fn main() {
    // let x = 5;
    // println!("{}", x);

    // let (x, y) = (42, 9);
    // println!("{}, {}", x, y);

    // let x: i32 = 5;

    // // x = 10;

    // let mut x = 7;
    // x = 8;
    // println!("{}", x);

    // let y: i32;
    // // println!("Hello {}", y);

    // {
    //     let z: i32 = 9;
    //     println!("{}, {}", x, z);
    // }
    // // println!("{}, {}", x, z);


    // shadowing

    // let x: i32 = 8;
    // {
    //     println!("{}", x);
    //     let x = 12;
    //     println!("{}", x);
    // }
    // println!("{}", x);
    // let x = 42;
    // println!("{}", x);

    let mut x: i32 = 1;
    x = 7;
    // x = "Foo"; <- NG mismatch types
    let x = x;
    // x = 8; <- NG, immutable
    println!("{}", x);
    let y = 4;
    let y = "Hoge";
    println!("{}", y);
}
