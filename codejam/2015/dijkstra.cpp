#include "dijkstra.h"

#include <stack>

using namespace Y2015;

void transform(std::stack<char>& str, bool& sign) {
    char a = str.top();
    str.pop();
    char b = str.top();
    str.pop();
    char ret = 0;

    if (a == '1' && b == '1') {
        ret = '1';
    } else if (a == '1' && b == 'i') {
        ret = 'i';
    } else if (a == '1' && b == 'j') {
        ret = 'j';
    } else if (a == '1' && b == 'k') {
        ret = 'k';
    } else if (a == 'i' && b == '1') {
        ret = 'i';
    } else if (a == 'i' && b == 'i') {
        sign = !sign;
        ret = '1';
    } else if (a == 'i' && b == 'j') {
        ret = 'k';
    } else if (a == 'i' && b == 'k') {
        sign = !sign;
        ret = 'j';
    } else if (a == 'j' && b == '1') {
        ret = 'j';
    } else if (a == 'j' && b == 'i') {
        sign = !sign;
        ret = 'k';
    } else if (a == 'j' && b == 'j') {
        sign = !sign;
        ret = '1';
    } else if (a == 'j' && b == 'k') {
        ret = 'i';
    }else if (a == 'k' && b == '1') {
        ret = 'k';
    } else if (a == 'k' && b == 'i') {
        ret = 'j';
    } else if (a == 'k' && b == 'j') {
        sign = !sign;
        ret = 'i';
    } else if (a == 'k' && b == 'k') {
        sign = !sign;
        ret = '1';
    } else {
        throw "WRONG";
    }

    str.push(ret);
    //std::cout << "New string " << str << std::endl;
}

bool findLetter(char letter, std::stack<char>& str, bool& sign) {
    while (true) {
        if (str.top() == letter && sign == false) {
            // remove it
            str.pop();
            break;
        }
        if (str.size() < 2) {
            return false;
        }

        transform(str, sign);
    }
    return true;
}

bool findLast(char letter, std::stack<char>& str, bool& sign) {
    while (true) {
        if (str.size() < 2) {
            return false;
        }
        //std::cout << "Size is " << str.size() << std::endl;
        transform(str, sign);
    }
    return true;
}



void Dijkstra::solveCase() {
    std::vector<long long> line = lineToVector<long long>();
    std::string next = getLine();

    std::stringstream fullStr;
    for (long long i = 0; i < line[1]; ++i) {
        fullStr << next;
    }
    // to to get ijk
    std::string str = fullStr.str();
    std::stack<char> reverseStr;
    for (std::reverse_iterator<std::string::iterator> r = str.rbegin(); r != str.rend(); ++r) {
        reverseStr.push(*r);
    }

    std::cout << "Str is  " << str;
    bool sign(false);
    if (!findLetter('i', reverseStr, sign)) {
        out << "NO";
        return;
    }
    if (!findLetter('j', reverseStr, sign)) {
        out << "NO";
        return;
    }
    findLast('k', reverseStr, sign);

    //std::cout << "Top is " <<  reverseStr.top() << std::endl;
    // check that no more letters are there
    if (reverseStr.top() != 'k' || sign) {
        out << "NO";
        return;
    }

    out << "YES";
    return;
}