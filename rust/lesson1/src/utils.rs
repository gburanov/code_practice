use std::io;
use std::fs::File;
use std::io::prelude::*;

pub fn load_file(str: String) -> Result<String, io::Error> {
    let mut file = try!(File::open(str));
    let mut s = String::new();
    try!(file.read_to_string(&mut s));
    //println!("{}", s);
    Ok(s)
}
