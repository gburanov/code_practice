#include <stdio.h>
#include "input_parser.h"
#include <iostream>

void assert(const std::vector<std::string>& input, conststd::vector<std::string>& output) {
  std::vector<std::
  pro
}

int tests() {
  std::vector<std::string> input;
  input.push_back(std::string("How much wood"));
  std::vector<std::string> output;
  output.push_back(std::string("I have no idea what you are talking about"));
  assert(input, output)
}

int main() {
  tests()
  printf("Start");

  std::vector<std::string> input;
  input.push_back(std::string("glob is I"));
  input.push_back(std::string("How much wood"));
  std::vector<std::string> output = process(input);

  for(std::vector<std::string>::const_iterator it = output.begin(); it != output.end(); ++it) {
    std::cout << *it << '\n';
  }
  return 0;
}
