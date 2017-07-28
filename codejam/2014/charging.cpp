#include "charging.h"
#include "../print_helpers.h"
#include "../string_helpers.h"

#include <vector>

using namespace Y2014;

typedef std::multiset<int> ChargeSet;

std::vector<ChargeSet> tryShift(std::multiset<int>& chargers_int, int digits) {
    std::multiset<int> ret;
    for (int i = 1; i <= digits; ++i ) {
        for (auto )
    }
}


void ChargingHaos::solveCase() {
    std::vector<int> vals = lineToVector<int>(2);
    std::vector<std::string> devices = lineToVector<std::string>(vals[0]);
    std::vector<std::string> chargers = lineToVector<std::string>(vals[1]);

    std::multiset<int> devices_int;
    ChargeSet chargers_int;
    for (const auto& a:  devices) {
        devices_int.insert(BinaryFromString(a));
    }
    for (const auto& b:  chargers) {
        chargers_int.insert(BinaryFromString(b));
    }
    std::cout << "Devices are " << devices_int << std::endl;
    std::cout << "Chargers are " << chargers_int << std::endl;


    std::vector<ChargeSet> trySets;
    trySets.push_back(chargers_int);
    int steps = 0;
    if (devices_int == chargers_int) {
        out

    }

    return;
}