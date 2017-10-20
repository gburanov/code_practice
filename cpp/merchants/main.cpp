#include <stdio.h>
#include "input_parser.h"
#include <iostream>

void assert(const StrVec& input, const StrVec& output) {
  StrVec testOutput = process(input);
  if (testOutput != output) {
    throw new std::string("it's the end of the world!");
  }
}

void tests() {
  test_roman();
  {
    StrVec input;
    input.push_back(std::string("How much wood"));
    StrVec output;
    output.push_back(std::string("I have no idea what you are talking about"));
    assert(input, output);
  }
}

int main() {
  tests();
  std::cout << "tests passed\n";

  std::vector<std::string> input;
  input.push_back(std::string("glob is I"));
  input.push_back(std::string("How much wood"));
  std::vector<std::string> output = process(input);

  for(std::vector<std::string>::const_iterator it = output.begin(); it != output.end(); ++it) {
    std::cout << *it << '\n';
  }
  return 0;
}
