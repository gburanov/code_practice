#ifndef PRINT_HELPERS_H
#define PRINT_HELPERS_H

#include <set>

template <typename T>
std::ostream &operator<<(std::ostream &os, const std::multiset<T>& objects) {
    os << "[";
    for (const auto& obj: objects) {
        os << obj << ", ";
    }
    os << "]";
    return os;
}

template <typename T>
std::ostream &operator<<(std::ostream &os, const std::vector<T>& objects) {
    os << "[";
    for (const auto& obj: objects) {
        os << obj << ", ";
    }
    os << "]";
    return os;
}

#endif // PRINT_HELPERS_H