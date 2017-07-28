#ifndef STRING_HELPERS_H
#define STRING_HELPERS_H

#include <vector>
#include <string>
#include <bitset>

std::vector<std::string> split(const std::string &s, char delim);

int IntFromChar(char s);


int IntFromString(std::string& s);
int BinaryFromString(const std::string& bitset);


unsigned int round_div(unsigned int dividend, unsigned int divisor);

#endif // STRING_HELPERS_H