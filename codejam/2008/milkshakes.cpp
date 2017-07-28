#include "milkshakes.h"

using namespace Y2008;

void Milkshakes::fillCustomer(Customer& c) {
    size_t likes = lineValue<int>();
    for (int i = 0; i < likes; ++i) {
        int milkshake_count = lineValue<int>();
        bool isWithmokka = lineValue<bool>();
        c.push_back(std::make_pair(milkshake_count, isWithmokka));
    }
}

bool NeedOnlyWithMokka(Customer& c, int& ret) {
    if (c.size() == 1 && c[0].second == true) {
        ret = c[0].first;
        return true;
    }
    return false;
}

bool NeedOnlyWithoutMokka(Customer& c) {
    for (auto& val: c) {
        if (val.second == true) {
            return false;
        }
    }
    return true;
}

void Milkshakes::solveCase() {
    size_t milkshakes_count = lineValue<int>();
    size_t customers_count = lineValue<int>();

    std::vector<int> milkshakes;
    for (size_t i = 0; i < milkshakes_count; ++i) {
        milkshakes.push_back(0);
    }

    std::vector<Customer> customers;
    customers.reserve(customers_count);
    for (size_t i = 0; i < customers_count; ++i) {
        Customer c;
        fillCustomer(c);
        customers.push_back(c);
    }
    std::vector<Customer>::iterator it = customers.begin();
    while (true) {
        if (it == customers.end()) {
            break;
        }

        Customer c = *it;
        int ret;
        if (NeedOnlyWithMokka(c, ret) && milkshakes[ret] == 0) {
            milkshakes[ret] = 1;
            it = customers.begin();
            continue;
        }
        if (NeedOnlyWithoutMokka(c) && milkshakes[ret] == 1) {
            out << "IMPOSSIBLE";
            return;
        }
        ++it;
    }
    for (auto& shake: milkshakes) {
        out << shake << " ";
    }


    return;
}