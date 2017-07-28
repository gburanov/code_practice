#include "base_solution.h"

const char* IOError::what() const throw()
{
    return "Error in I/O";
}

IOError IOErr;

BaseSolution::~BaseSolution()
{
    // Write the output to the file if necessary
    if(outFile)
    {
        outFile << out.str();
        outFile.close();
    }

    // Also dump output to standard out
    cout << out.str();
}

int BaseSolution::process(const std::string& input, const std::string& output)
{
    open(input, output);
    run();
    return 0;
}

void BaseSolution::open(const std::string& input, const std::string& output)
{
    // Open input file
    inFile.open(input.c_str());
    if(!inFile)
    {
        cerr << "Error opening file " << input << endl;
        throw IOErr;
    }

    // If we were given a second argument on the commandline, use it as an
    // output file.
    outFile.open(output.c_str());
}

void BaseSolution::run()
{
    // Start by reading the number of cases
    initialRead();

    for(unsigned int t = 0; t < numCases; ++t)
    {
        // Write out case #
        out << "Case #" << t + 1 << ": ";
        caseNumber  = t;
        solveCase();
        out << endl;
    }
}

void BaseSolution::initialRead()
{
    numCases = lineValue<int>();
}

std::string BaseSolution::wholeString()
{
    return getLine();
}

void BaseSolution::flushLine()
{
    // Flush up to next newline
    inFile.ignore(numeric_limits<streamsize>::max(),'\n');
}

string BaseSolution::getLine()
{
    string line;
    getline(inFile, line);
    return line;
}