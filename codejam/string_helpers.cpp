#include "string_helpers.h"

#include <string>
#include <sstream>
#include <vector>

std::vector<std::string> &split(const std::string &s, char delim, std::vector<std::string> &elems) {
    std::stringstream ss(s);
    std::string item;
    while (std::getline(ss, item, delim)) {
        elems.push_back(item);
    }
    return elems;
}


std::vector<std::string> split(const std::string &s, char delim) {
    std::vector<std::string> elems;
    split(s, delim, elems);
    return elems;
}

int IntFromChar(char s)
{
    return s - '0';
}

int IntFromString(std::string& s) {
    int ret;
    std::istringstream ss(s);
    ss >> ret;
    return ret;
}


int BinaryFromString(const std::string& bitset)
{
    std::bitset<16> bs(bitset);
    return bs.to_ulong();
}

unsigned int round_div(unsigned int dividend, unsigned int divisor)
{
    return (dividend + (divisor / 2)) / divisor;
}