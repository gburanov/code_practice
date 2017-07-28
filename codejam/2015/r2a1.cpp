#include "r2a1.h"

using namespace Y2015;

int pow (int num, int exp)
{
  int out = 1;
  while (exp-- > 0)
    out *= num;
  return out;
}

int Reverse(int num)
{
  //get num digits
  int nb_digits = 0;
  while (num / pow(10,nb_digits) > 0)
    ++nb_digits;

  //add the digits, one at a time:
  int out = 0, iterator = nb_digits;
  while (iterator > 0)
  {
    out += num / pow(10,iterator-1) * pow(10,nb_digits-iterator);
    num %= pow(10, --iterator);
  }
  return out;
}

template <class T>
int numDigits(T number)
{
  int digits = 0;
  if (number < 0) digits = 1; // remove this line if '-' counts as a digit
  while (number) {
    number /= 10;
    digits++;
  }
  return digits;
}

long steps_to_get_to(int number);

long steps_to_get_to(int number, int digits) {
  int ten_pow = 2 * pow(10, digits - 1);
  int ten_pow_minus = pow(10, digits - 2);

  if (number < ten_pow) {
    int ret = (ten_pow - ten_pow_minus + 1) + steps_to_get_to(ten_pow - ten_pow_minus + 1);
    return ret;
  }
  int first_part = Reverse((number / ten_pow) * ten_pow + 1);
  int second_part = number - first_part;
  return steps_to_get_to(first_part) + second_part + 1;
}

// step to get to degree + 1
long steps_to_get_to(int number) {
  if (number < 20) {
    return number;
  }
  if (number < 100) {
    int first_part = (number / 10) * 10 + 1;
    int second_part = number - first_part;
    int ret = 10 + first_part/10 + 1 + second_part;
    return ret;
  }
  if (number < 200) {
    int ret = (number - 91) + steps_to_get_to(91);
    return ret;
  }
  int digits = numDigits(number);
  return steps_to_get_to(number, digits);
}

void Test1::solveCase() {
  int number = lineValue<int>();
  std::cout << "Number is " << number << std::endl;
  long steps = steps_to_get_to(number);

  std::cout << "Steps are " << steps << std::endl;
  out << steps;
  return;
}