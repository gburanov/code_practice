use utils;

struct Box {
    coords: Vec<i32>,
}

impl Box {
    fn paper(&self) -> i32 {
        let sum = self.coords.iter().fold(0, |sum, &val| {sum + val*6});
        let min = self.coords.iter().min();
        //let sum = self.coords[0];
        sum + min
    }
}

fn fill_structs() -> Vec<Box> {
    let mut ret = Vec::new();
    let name = "lesson2.txt".to_string();
    let str = utils::load_file(name).unwrap();
    for line in str.lines() {
        let coords: Vec<i32> = line.split("x").
            map(|s| s.parse::<i32>().unwrap()).
            collect();
        let my_box = Box { coords: coords };
        ret.push(my_box);
    }
    ret
}

pub fn start() {
    let boxes = fill_structs();
    let sum = boxes.iter().fold(0, |sum, val| {
        sum + val.paper()
    });
    println!("paper needed is {}", sum);
}
