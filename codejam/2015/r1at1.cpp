#include "r1at1.h"
#include "../print_helpers.h"

using namespace Y2015;

void R1AT1::solveCase() {
    int n = lineValue<int>();
    std::vector<int> mushrooms = lineToVector<int>(n);

    //std::cout << "mushrooms " << mushrooms << std::endl;

    long long firstMethod = 0;
    std::vector<int>::iterator it1 = mushrooms.begin();
    std::vector<int>::iterator it2 = mushrooms.begin();
    ++it2;
    while (it2 != mushrooms.end()) {
        int diff = *it1 - *it2;
        if (diff > 0) {
            firstMethod += diff;
        }
        ++it1;
        ++it2;
    }
    //


    long long secondMethod = 0;
    int maxPositiveDiff = 0;
    it1 = mushrooms.begin();
    it2 = mushrooms.begin();
    ++it2;
    while (it2 != mushrooms.end()) {
        int diff = *it1 - *it2;
        if (diff > 0 &&  diff >  maxPositiveDiff) {
            maxPositiveDiff = diff;
        }
        ++it1;
        ++it2;
    }
    std::cout << "maxPositiveDiff "  << maxPositiveDiff << std::endl;

    it1 = mushrooms.begin();
    it2 = mushrooms.begin();
    ++it2;

    long long totalMushrooms(0);
    while (it2 != mushrooms.end()) {
            totalMushrooms = *it1;

            if ((totalMushrooms - maxPositiveDiff) >= 0) {
                // Unable to eat them all
                totalMushrooms -= maxPositiveDiff;
                secondMethod += maxPositiveDiff;
            } else {
                // eat them all
                secondMethod += totalMushrooms;
                totalMushrooms = 0;
            }
            //std::cout << "totalMushrooms "  << totalMushrooms << std::endl;
            //std::cout << "secondMethod "  << secondMethod << std::endl;
            ++it1;
            ++it2;
    }


    out << firstMethod << " " << secondMethod;
    return;
}