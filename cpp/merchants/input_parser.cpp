#include "input_parser.h"

std::vector<std::string> process(std::vector<std::string>& str) {
  std::vector<std::string> ret;

  for (std::vector<std::string>::const_iterator it = str.begin(); it != str.end(); ++it) {
    ret.push_back(std::string("I have no idea what you are talking about"));
  }
  return ret;
}
