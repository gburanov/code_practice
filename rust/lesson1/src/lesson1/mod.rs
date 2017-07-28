pub use utils;

pub fn lesson12() {
    let mut floor = 0;
    let mut index = 0;
    let name = "lesson1.txt".to_string();
    let s = utils::load_file(name).unwrap();
    for c in s.chars() {
        index += 1;
        if c == '(' {
            floor = floor + 1;
        } else if c == ')' {
            floor = floor - 1;
        }
        if floor == -1 { break; }
    }
    println!("Index is {}", index);
}
