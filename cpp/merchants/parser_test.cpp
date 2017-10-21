#include "parser_test.h"
#include "input_parser.h"

#include <iostream>

int I_VAL1 = 1;
int V_VAL1 = 5;
int X_VAL1 = 10;
int L_VAL1 = 50;
int C_VAL1 = 100;
int D_VAL1 = 500;
int M_VAL1 = 1000;

void assert_roman(const std::vector<int>& input, int out) {
    int ret = fromRoman(input);
    if (ret != out) {
      std::cout << "Error should be " << out << " but " << ret << "\n";
      throw new std::string("BAD");
    }
}

void test_string_splitting() {


}

void test_roman_one_substraction() {
  std::vector<int> rom;
  rom.push_back(X_VAL1);
  rom.push_back(L_VAL1);
  rom.push_back(I_VAL1);
  rom.push_back(I_VAL1);
  assert_roman(rom, 42);
}

void test_roman_without_subtraction() {
  std::vector<int> rom;
  rom.push_back(X_VAL1);
  rom.push_back(I_VAL1);
  assert_roman(rom, 11);
}

void test_roman_substraction_in_the_middle() {
  std::vector<int> rom;
  rom.push_back(L_VAL1);
  rom.push_back(I_VAL1);
  rom.push_back(X_VAL1);
  assert_roman(rom, 59);
}

static void assert_equal_strings(const std::string& expected, const std::string& actual) {
  if (expected != actual) {
    std::cout << "Expected " << expected << " but got " << actual << std::endl;
    throw new std::string("assert_equal_strings failed");
  }
}

static void assert_equal(int expected, int actual) {
  if (expected != actual) {
    std::cout << "Expected " << expected << " but got " << actual << std::endl;
    throw new std::string("assert_equal failed");
  }
}

void test_conversion_of_roman_chars() {
  assert_equal(1, getLatinDigit('I'));
  assert_equal(5, getLatinDigit('V'));
  assert_equal(10, getLatinDigit('X'));
  assert_equal(50, getLatinDigit('L'));
  assert_equal(100, getLatinDigit('C'));
  assert_equal(500, getLatinDigit('D'));
  assert_equal(1000, getLatinDigit('M'));
}

void test_failed_conversion_of_roman_char() {
  try {
    getLatinDigit('a');
    throw int(0);
  }
  catch (const std::string&) {
  }
}

void test_splitting_by_word() {
  auto ret = splitStringByDelimiter("glob is I", " is ");
  assert_equal_strings("glob", ret[0]);
  assert_equal_strings("I", ret[1]);
}

void test_splitting_empty_string() {
  auto ret = splitStringByDelimiter("", " ");
  assert_equal(1, ret.size());
  assert_equal_strings("", ret[0]);
}

void test_splitting_empty_delimiter() {
  auto ret = splitStringByDelimiter("foo bar", "");
  assert_equal(1, ret.size());
  assert_equal_strings("foo bar", ret[0]);
}


void test_splitting_by_space() {
  auto ret = splitStringByDelimiter("glob is I", " ");
  assert_equal_strings("glob", ret[0]);
  assert_equal_strings("is", ret[1]);
  assert_equal_strings("I", ret[2]);
}

void test_splitting() {
  test_splitting_by_word();
  test_splitting_by_space();
  test_splitting_empty_string();
  test_splitting_empty_delimiter();
}

void test_roman() {

  test_roman_without_subtraction();
  test_roman_one_substraction();
  test_roman_substraction_in_the_middle();

  test_conversion_of_roman_chars();
  test_failed_conversion_of_roman_char();
}
