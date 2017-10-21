#include <string>
#include <vector>

// public
typedef std::vector<std::string> StrVec;
StrVec process(const StrVec& str);


void init();
std::vector<std::string> splitStringByDelimiter(std::string s, const std::string& delimiter);

// private
int fromRoman(const std::vector<int>& from);
std::vector<std::string> splitStringByDelimiter(std::string s, const std::string& delimiter);
int getLatinDigit(char ch);
