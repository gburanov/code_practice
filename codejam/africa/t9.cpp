#include "t9.h"

#include <sstream>

using namespace Africa;

std::stringstream enterChar(char ch, char& last_pressed)
{
    std::stringstream out;
    std::string enter;
    switch(ch) {
        case 'a':
            enter = "2";
            break;
        case 'b':
            enter = "22";
            break;
        case 'c':
            enter = "222";
            break;

        case 'd':
            enter = "3";
            break;
        case 'e':
            enter = "33";
            break;
        case 'f':
            enter = "333";
            break;

        case 'g':
            enter = "4";
            break;
        case 'h':
            enter = "44";
            break;
        case 'i':
            enter = "444";
            break;

        case 'j':
            enter = "5";
            break;
        case 'k':
            enter = "55";
            break;
        case 'l':
            enter = "555";
            break;

        case 'm':
            enter = "6";
            break;
        case 'n':
            enter = "66";
            break;
        case 'o':
            enter = "666";
            break;

        case 'p':
            enter = "7";
            break;
        case 'q':
            enter = "77";
            break;
        case 'r':
            enter = "777";
            break;
        case 's':
            enter = "7777";
            break;

        case 't':
            enter = "8";
            break;
        case 'u':
            enter = "88";
            break;
        case 'v':
            enter = "888";
            break;

        case 'w':
            enter = "9";
            break;
        case 'x':
            enter = "99";
            break;
        case 'y':
            enter = "999";
            break;
        case 'z':
            enter = "9999";
            break;

        case ' ':
            enter = "0";
            break;

        default:
            throw "wrong token";
    }

    if (last_pressed == enter[0]) {
        out << ' ';
    }
    out << enter;
    last_pressed = enter[0];
    return out;
}

void T9Solution::solveCase() {
    std::string str = wholeString();
    char last_pressed;
    for (const char& ch: str) {
        std::stringstream ss = enterChar(ch, last_pressed);
        out << ss.str();
    }
    return;
}