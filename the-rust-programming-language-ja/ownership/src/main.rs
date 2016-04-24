fn main() {
    println!("Hello, world!");

    // let v = vec![1, 2, 3];
    // let v2 = v;
    // println!("v[0] is: {}", v[0]);

    // let v = vec![1, 2, 3];
    // take(v);
    // println!("v[0] is: {}", v[0]);

    // let v = 1;
    // let v2 = v;
    // println!("v is: {}", v);

    // let a = 5;
    // let _y = double(a);
    // println!("{}", a);

    let a = true;
    let _y = change_truth(a);
    println!("{} {}", a, _y);
}

fn change_truth(x: bool) -> bool {
    !x
}

fn double(x: i32) -> i32 {
    x * 2
}

fn take(v: Vec<i32>) {
    //
}
