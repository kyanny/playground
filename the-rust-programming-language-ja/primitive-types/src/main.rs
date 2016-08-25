fn main() {
    println!("Hello, world!");

    let a = [1, 2, 3];

    let mut m = [1, 2, 3];

    let aa = [0; 20];
    println!("len(a) = {}", a.len());
    println!("len(aa) = {}", aa.len());
    println!("{}", a[1]);
    println!("{}", aa[19]);

    println!("{}", a[a.len()-1]);

    let a = [0, 1, 2, 3, 4];
    let complete = &a[..];
    println!("{}", complete.len());
    let middle = &a[1..4];
    println!("{} / {} / {}", middle.len(), middle[0], middle[middle.len()-1]);


    let tuple = (1, "Hello");

    let tuple: (i32, &str) = (1, "Hello");


    let mut t1 = (1, "Hello");
    let t2 = (2, "World");
    let mut t3: (&str, &str) = ("Hello", "World");
    t1 = t2;
    // t3 = t2;

    let (x, y, z) = (1, 2, "3");
    println!("{}, {}, {}", x+1, y+1, z);

    // let (x) = (0,);
    // println!("{}", x);

    (0);
    (0,);

    let tuple: (i32, i32, i32) = (1, 2, 3);
    let x = tuple.0;
    let y = tuple.1;
    let z = tuple.2;
    println!("{} {} {}", x, y, z);

    let t = (99,);
    let k = t.0;
    println!("{}", k);
}
