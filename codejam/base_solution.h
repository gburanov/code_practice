#ifndef CODESOLUTION_H
#define CODESOLUTION_H

#include <exception>
#include <fstream>
#include <iostream>
#include <iterator>
#include <limits>
#include <string>
#include <sstream>
#include <vector>

using namespace std;

class IOError: public exception
{
    virtual const char* what() const throw();
};


class BaseSolution
{
public:
    ~BaseSolution();

    int process(const std::string& input, const std::string& output);
    void run();

protected:
    // Basic functionality
    void open(const std::string& input, const std::string& output);

    // Useful helpers
    string getLine();
    template<typename T> void lineToVector(vector<T>& vec, size_t n=0);
    template<typename T> vector<T> lineToVector(size_t n=0);
    template<typename T> T lineValue();
    std::string wholeString();

    void flushLine();

    virtual void initialRead();
    ostringstream out;
    unsigned int numCases;
    ifstream inFile;

    // should override it
    virtual void solveCase() = 0;

    int caseNumber;
private:
    ofstream outFile;
};

template<typename T> T BaseSolution::lineValue()
{
    T value;
    istringstream buf(getLine());
    buf >> value;
    return value;
}

template<typename T> void BaseSolution::lineToVector(vector<T>& vec, size_t n)
{
    if(n > 0)
        vec.reserve(n);
    istream_iterator<T> eos;
    istringstream buf(getLine());
    vec.insert(vec.end(), istream_iterator<T>(buf), eos);
}

template<typename T> vector<T> BaseSolution::lineToVector(size_t n)
{
    vector<T> vec;
    lineToVector(vec, n);
    return vec;
}

#endif // CODESOLUTION_H
