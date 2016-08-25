fn main() {
    println!("Hello, world!");

    let v1 = vec![1, 2, 3];
    let v2 = vec![1, 2, 3];

    let (v1, v2, a) = foo(v1, v2);
    println!("v1[0] = {}, v2[0] = {}, a = {}", v1[0], v2[0], a);

    println!("====");

    let v1 = vec![1, 2, 3];
    let v2 = vec![1, 2, 3];
    let a = bar(&v1, &v2);
    println!("v1[0] = {}, v2[0] = {}, a = {}", v1[0], v2[0], a);

    println!("====");

    // let v = vec![1, 2, 3];
    // baz(&v);

    let mut x = 5;
    {
        let y = &mut x;
        *y += 1;
    }
    println!("{}", x);

    println!("====");

    let mut v = vec![1, 2, 3];
    for x in &v {
        println!("{}", x);
    }

    println!("====");

    let mut v = vec![1, 2, 3];
    for x in &v {
        println!("{}", x);
        // v.push(34);
    }

    // let y: &i32;
    // {
    //     let x = 5;
    //     y = &x;
    // }
    // println!("{}", y);

    // let y: &i32;
    // let x = 5;
    // y = &x;
    // println!("{}", y);

    let x = 5;
    let y: &i32;
    y = &x;
    println!("{}", y);
}

fn foo(v1: Vec<i32>, v2: Vec<i32>) -> (Vec<i32>, Vec<i32>, i32) {
    println!("v1[0] = {}", v1[0]);
    println!("v2[0] = {}", v2[0]);
    (v1, v2, 42)
}

fn bar(v1: &Vec<i32>, v2: &Vec<i32>) -> i32 {
    println!("v1[0] = {}", v1[0]);
    println!("v2[0] = {}", v2[0]);
    42
}

fn baz(v: &Vec<i32>) {
    // v.push(5);
}
