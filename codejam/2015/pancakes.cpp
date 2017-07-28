#include "pancakes.h"
#include "../print_helpers.h"

#include <set>
#include <cmath>

using namespace Y2015;

int timeToPlay(const std::multiset<int>& cakes)
{
    return *cakes.rbegin();
}

int removeTop(std::multiset<int>& cakes) {
    std::multiset<int>::reverse_iterator it = cakes.rbegin();
    int top = *it;
    int time = 0;
    if (top == 1) {
        // impossible
        return -1;
    }

    while (top == *it) {
        cakes.insert(std::ceil((float)top / 2));
        cakes.insert(std::floor((float)top / 2));
        ++it;
        ++time;
    }
    cakes.erase(top);
    std::cout << "Decrease to " << cakes << std::endl;

    return time;
}

int play(const std::multiset<int>& cakes) {
    int scoreOriginal = timeToPlay(cakes);

    std::multiset<int> cakesnew = cakes;
    int time = removeTop(cakesnew);
    if (time == -1) {
        return scoreOriginal;
    }

    int scorenew = time + play(cakesnew);
    return std::min(scoreOriginal, scorenew);
}

void Pancakes::solveCase() {
    int eaters = lineValue<int>();
    std::vector<int> cakes_tmp = lineToVector<int>(eaters);
    std::multiset<int> cakes(cakes_tmp.begin(), cakes_tmp.end());
    int endScore = play(cakes);
    std::cout << "Cakes " << cakes_tmp << " took " << endScore << " to play" << std::endl;

    // try to remove top
    out << endScore;
    return;
}