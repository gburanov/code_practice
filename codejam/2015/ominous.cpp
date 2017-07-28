#include "ominous.h"

#include <vector>
#include <cmath>

using namespace Y2015;

// Seems in this case the solution is easy
void Ominous::solveCase() {
    std::vector<int> input = lineToVector<int>();

    int x = input[0];
    int r = input[1];
    int c = input[2];
    //std::cout << "X is " << x << " R is " << r << " and C is " << c << std::endl;

    if (x > std::max(r,c)) {
        out << "RICHARD";
        std::cout << "Case " << caseNumber << " x is bigger then any of r or c" << std::endl;
        std::cout << "X is " << x << " R is " << r << " and C is " << c << std::endl << std::endl;
        return;
    }

    // divite it into two to check if this can fit
    int half = ceil((float)x / 2);
    if (half > std::min(r,c)) {
        out << "RICHARD";
        std::cout << "Case " << caseNumber << " x/2 is bigger then min of r or c" << std::endl;
        std::cout << "X is " << x << " R is " << r << " and C is " << c << std::endl << std::endl;
        return;
    }

    // check how much space left
    long long space = ((long long)r * c) - x;
    //std::cout << "Space left " << space;
    if (space % x) {
        out << "RICHARD";
        std::cout << "Case " << caseNumber << " no space left" << std::endl;
        std::cout << "X is " << x << " R is " << r << " and C is " << c << std::endl << std::endl;
        return;
    }

    // Also consider the example
    // fit 4-n in 4*2
    // this is not possible
    if (x == 4 && (std::min(r,c) < 3)) {
        out << "RICHARD";
        return;
    }

    std::cout << "We can do it " << std::endl;
    std::cout << "X is " << x << " R is " << r << " and C is " << c << std::endl << std::endl;

    // He won
    out << "GABRIEL";
    return;
}