#include "reserve_words.h"

#include <iterator>

#include "../string_helpers.h"

using namespace Africa;

void ReverseWordsSolution::solveCase() {
    std::vector<std::string> strings = lineToVector<std::string>();
    std::vector<std::string>::iterator it = strings.end();
    while (it != strings.begin())
    {
        --it;
        out << *it;
        if (it != strings.begin()) {
            out << " ";
        }
    }
    return;
}