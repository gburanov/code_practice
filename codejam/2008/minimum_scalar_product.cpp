#include "minimum_scalar_product.h"

#include <vector>

using namespace Y2008;

//The minimum sum of products occurs only when you multiply a smaller number in vector
// with the larger number in vector 2 and add all such occurrences.
long long calculate(std::vector<int>& array1, std::vector<int>& array2)
{
    long long ret = 0;
    std::sort(array1.begin(), array1.end());
    std::sort(array2.begin(), array2.end(), std::greater<int>());

    auto it1 = array1.begin();
    auto it2 = array2.begin();
    while (true) {
        if (it1 == array1.end()) {
            break;
        }

        int v1 = *it1;
        int v2 = *it2;
        //std::cout << v1 << " * " << v2 << std::endl;
        ret += static_cast<long long>(v1) * v2;
        ++it1;
        ++it2;
    }

    return ret;
}

void MinimalScalarProduct::solveCase() {
    size_t items_count = lineValue<int>();
    std::vector<int> array1 = lineToVector<int>(items_count);
    std::vector<int> array2 = lineToVector<int>(items_count);

    long long min = calculate(array1, array2);
    out << min;
    return;
}