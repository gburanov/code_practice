#include "store_credit.h"

#include <map>

using namespace Africa;

std::pair<unsigned int, unsigned int> solve(unsigned int total_credit, std::vector<unsigned int>& items) {
    std::multimap<int, int> mapItems;
    int i = 1;
    for (const auto& item: items) {
        mapItems.insert(std::make_pair(item, i));
        ++i;
    }
    // create two iterator (from begin and from end) and move them
    auto itBegin = mapItems.begin();
    auto itEnd = mapItems.end();

    while (true) {
        int val = itBegin->first + itEnd->first;
        if (val == total_credit && (itBegin->second != itEnd->second)) {
            int lower = itBegin->second;
            int upper = itEnd->second;
            return std::make_pair(std::min(lower, upper), std::max(lower, upper));
        }
        if (val < total_credit) {
            ++itBegin;
            //std::cout << "begin is " << itBegin->second << std::endl;
            itEnd = mapItems.end();
        } else {
            if (itEnd == mapItems.begin()) {
                ++itBegin;
                //std::cout << "begin is " << itBegin->second << std::endl;
                itEnd = mapItems.end();
            }
            --itEnd;
            //std::cout << "end is " << itEnd->second << std::endl;
        }
    }


    return std::make_pair(0, 0);
}

void StoreCreditSolution::solveCase() {
    unsigned int total_credit = lineValue<int>();
    size_t items_count = lineValue<int>();
    std::vector<unsigned int> items = lineToVector<unsigned int>(items_count);
    std::pair<unsigned int, unsigned int> ret = solve(total_credit, items);
    std::cout << "Found " << ret.first << " " << ret.second << std::endl;
    std::cout.flush();
    out << ret.first << " " << ret.second;
    return;
}