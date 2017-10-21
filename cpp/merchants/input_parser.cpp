#include "input_parser.h"

#include <climits>
#include <iostream>
#include <map>

int I_VAL = 1;
int V_VAL = 5;
int X_VAL = 10;
int L_VAL = 50;
int C_VAL = 100;
int D_VAL = 500;
int M_VAL = 1000;

static std::map<char, int> LATIN_TO_INT;

void init() {
  LATIN_TO_INT.insert(std::make_pair('I', 1));
  LATIN_TO_INT.insert(std::make_pair('V', 5));
  LATIN_TO_INT.insert(std::make_pair('X', 10));
  LATIN_TO_INT.insert(std::make_pair('L', 50));
  LATIN_TO_INT.insert(std::make_pair('C', 100));
  LATIN_TO_INT.insert(std::make_pair('D', 500));
  LATIN_TO_INT.insert(std::make_pair('M', 1000));
}

int getLatinDigit(char ch) {
  auto it = LATIN_TO_INT.find(ch);
  if (it == LATIN_TO_INT.end()) {
    throw std::string("No roman digit for that");
  }
  return it->second;
}

int fromRoman(const std::vector<int>& from) {
  int ret = 0;
  int prev = INT_MAX;
  for (std::vector<int>::const_iterator it = from.begin(); it != from.end(); ++it) {
    if (prev >= *it) {
      ret += *it;
    } else {
      ret += *it;
      ret -= 2*prev;
    }
    prev = *it;
  }
  return ret;
}

std::vector<std::string> splitStringByDelimiter(std::string s, const std::string& delimiter) {
  std::vector<std::string> ret;
  size_t pos = 0;
  std::string token;
  if (delimiter.empty()) {
    ret.push_back(s);
    return ret;
  }

  while ((pos = s.find(delimiter)) != std::string::npos) {
      token = s.substr(0, pos);
      ret.push_back(token);
      s.erase(0, pos + delimiter.length());
  }
  ret.push_back(s);
  return ret;
}

std::vector<std::pair<std::string, int> > conversions;

std::string processHowMany(const std::string& howMuch) {
  std::string ret;
  return ret;
}

std::string processHowMuch(const std::string& howMuch) {
  std::string ret;

  return ret;
}

void processAssignment(const std::string& assignment) {

}

StrVec process(const StrVec& str) {
  StrVec ret;

  for (StrVec::const_iterator it = str.begin(); it != str.end(); ++it) {

    ret.push_back(std::string("I have no idea what you are talking about"));
  }
  return ret;
}
