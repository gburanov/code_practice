#include "repeater.h"
#include "../print_helpers.h"
#include "../string_helpers.h"

using namespace Y2014;

void Repeater::solveCase() {
    int wordsCount = lineValue<int>();

    std::vector<std::string> words;
    for (auto i = 0; i < wordsCount; ++i) {
        std::string word = lineValue<std::string>();
        words.push_back(word);
    }

    //std::cout << "Words " << words << std::endl;
    int a = 59 / 4;
    std::cout << " a is " << a << std::endl;


    int totalMoves = 0;
    std::vector<int> positions;
    positions.resize(wordsCount);

    while (true) {
        char currentLetter = 0;

        long long average = 0;
        for (int iWordCount = 0; iWordCount < wordsCount; ++iWordCount) {
            average += positions[iWordCount];
        }
        average = round_div(average, wordsCount);
        for (int iWordCount = 0; iWordCount < wordsCount; ++iWordCount) {
            totalMoves += std::abs(average - positions[iWordCount]);
        }

        bool allEmpty = true;
        for (int iWordCount = 0; iWordCount < wordsCount; ++iWordCount) {
            // check all are empty
            std::string word = words[iWordCount];
            if (!word.empty()) {
                allEmpty = false;
            }
        }

        if (allEmpty) {
            out << totalMoves;
            return;
        }

        for (int iWordCount = 0; iWordCount < wordsCount; ++iWordCount) {
            std::string word = words[iWordCount];
            if (word.empty()) {
                out << "Fegla Won";
                return;
            }
            int position = 0;

            if (!currentLetter && iWordCount == 0) {
                currentLetter = word[position];
            } else {
                if (currentLetter != word[position]) {
                    break;
                }
            }

            while (currentLetter == word[position]) {
                ++position;
                if (position == word.size()) {
                    break;
                }
            }
            if (position) {
                positions[iWordCount] = position;
                word = word.substr(position, word.size());
                words[iWordCount] = word;
            }
            //std::cout << "Now word is " << word << std::endl;
        }


    }


    return;
}