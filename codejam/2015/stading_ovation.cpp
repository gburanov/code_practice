#include "standing_ovation.h"
#include "../string_helpers.h"
#include "../print_helpers.h"

#include <vector>

using namespace Y2015;

// we need to have at least one guy at each shyness level
// Solution:
// Go from min shy level to max adding people when needed

void StandingOvation::solveCase() {
    std::vector<std::string> twovals = lineToVector<std::string>();

    int maxShyLevel = IntFromString(twovals[0]);
    std::string people = twovals[1];
    std::cout  << people << std::endl;

    long long totalShy =  0;
    long long guysToAdd = 0;
    for (size_t i = 0; i < people.size(); ++i) {
        int shyPeople = IntFromChar(people[i]);
        totalShy += shyPeople;

        if (i >= totalShy) {
            // need to add guys
            long guysToAddLocal = (i + 1 - totalShy);
            totalShy += guysToAddLocal;
            std::cout << "Added " << guysToAddLocal << " to " << i << std::endl;
            guysToAdd += guysToAddLocal;
        }

    }

    out << guysToAdd;
    return;
}