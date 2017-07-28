#ifndef MILKSHAKES_H
#define MILKSHAKES_H

#include "../base_solution.h"

typedef std::vector<std::pair<int, bool>> Customer;

namespace Y2008
{
    class Milkshakes : public BaseSolution
    {
    public:
        virtual void solveCase() override final;

    private:
        void fillCustomer(Customer& c);
    };

}

#endif // MILKSHAKES_H