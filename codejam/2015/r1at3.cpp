#include "r1at3.h"
#include "../print_helpers.h"


#include <map>

using namespace Y2015;

long long gcd(long long a,long long b)
{
    if (b == 0) {
        return a;
    } else {
        return gcd(b, a % b);
    }
}

long long lcm(long long a,long long b)
{
    return std::abs(a * b) / gcd(a, b);
}



int find_closest_barder(std::vector<std::pair<int, int>>& barbers) {
    int i = 1;
    for (std::vector<std::pair<int, int>>::iterator it = barbers.begin(); it != barbers.end(); ++it) {
        if (it->second == 0) {
            it->second = it->first;
            return i;
        }
        ++i;
    }
    return -1;
}


void R1At3::solveCase() {
    std::vector<int> numbers = lineToVector<int>();
    long long myplace = numbers[1];
    std::vector<int> barbers_tmp = lineToVector<int>();

    std::cout << "My place " << myplace << std::endl;
    std::cout << "My barbers " << barbers_tmp << std::endl;

    // bool is blocked
    // second int - time left
    std::vector<std::pair<int, int> > barbers;
    for (const auto& barber: barbers_tmp) {
        barbers.push_back(std::make_pair(barber, 0));
    }

    // we can optimize - check when the situation is the same as at begin
    // ie all the barbers are free and you are at the begin of the queue
    std::vector<int>::iterator it1 = barbers_tmp.begin();
    long long lcm_val = 0;
    while (it1 != barbers_tmp.end()) {
        if (!lcm_val) {
            lcm_val = *it1;
        } else {
            lcm_val = lcm(*it1, lcm_val);
        }

        ++it1;
    }
    std::cout << "lcm is " << lcm_val << std::endl;

    if (lcm_val < 121732321394494) {
        // how much can they handle
        int canHandle = 0;
        for (std::vector<std::pair<int, int> >::iterator it = barbers.begin(); it != barbers.end(); ++it) {
            canHandle += lcm_val / it->first;
        }

        std::cout << "canHandle " << canHandle << std::endl;

        while (myplace > canHandle) {
            myplace -= canHandle;
        }
        std::cout << "My place is " << myplace << " after optimization" << std::endl;
    }

    // ok optimized now start
    // take lowest barber
    while (myplace) {
        int barber = find_closest_barder(barbers);
        //std::cout << "found braber" << barber << std::endl;
        while (barber != -1) {
            --myplace;
            if (myplace == 0) {
                out << barber;
                std::cout << "Solved " << barber << std::endl;
                return;
            }
            barber = find_closest_barder(barbers);
            //std::cout << "found braber" << barber << std::endl;
        }
        // all barbers are busy

        for (std::vector<std::pair<int, int>>::iterator it = barbers.begin(); it != barbers.end(); ++it) {
            it->second --;
        }

    }


    return;
}