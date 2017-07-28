#include <iostream>
#include <sstream>
#include <stdint.h>
#include <stdlib.h>
#include <cstdio>

struct Ipv4
{
	Ipv4(char ip1, char ip2, char ip3, char ip4)
	{
		bytes[0] = ip1;
		bytes[1] = ip2;
		bytes[2] = ip3;
		bytes[3] = ip4;
	}
	char bytes[4];

	std::string to_s() const
	{
		std::stringstream ss;
		ss << static_cast<unsigned>(bytes[0]) << "."
				<< static_cast<unsigned>(bytes[1]) << "."
				<< static_cast<unsigned>(bytes[2]) << "."
				<< static_cast<unsigned>(bytes[3]);
		return ss.str();
	}

	bool compareFirstNbits(char bits, Ipv4 other)
	{
		uint32_t& c1 = reinterpret_cast<uint32_t&>(bytes);
		uint32_t& c2 = reinterpret_cast<uint32_t&>(other.bytes);
		int mask = (1 << bits) - 1;
		return (c1 & mask) == (c2 & mask);
	}
};


struct CIDRRange
{
	static CIDRRange createFromString(const char* str)
	{
		unsigned short a, b, c, d, e;
		sscanf(str, "%hu.%hu.%hu.%hu:%hu", &a, &b, &c, &d, &e);
		return CIDRRange(Ipv4(a, b, c, d), e);
	}

	CIDRRange(Ipv4 _ipv4, char _suffix)
		: ipv4(_ipv4)
		, suffix(_suffix)
		{
		}
	Ipv4 ipv4;
	char suffix;

	std::string to_s() const
	{
		std::stringstream ss;
		ss << ipv4.to_s() << ":" << static_cast<unsigned>(suffix);
		return ss.str();
	}
};


class CIDRComparator {
public:
        enum CIDRComparatorResult {
                Equals,
                Subset,
                Superset,
                Disjoint
        };
        CIDRComparatorResult compareCIDR(const char* a, const char* b)
        {
        	CIDRRange sidr1 = CIDRRange::createFromString(a);
        	CIDRRange sidr2 = CIDRRange::createFromString(b);
        	std::cout << "Started comparing " << sidr1.to_s() << " with " << sidr2.to_s() << std::endl;
        	if (sidr1.suffix == sidr2.suffix)
        	{
        		return sidr1.ipv4.compareFirstNbits(sidr1.suffix, sidr2.ipv4) ? Equals : Disjoint;
        	}
        	char n = std::min(sidr1.suffix, sidr2.suffix);
        	if (sidr1.ipv4.compareFirstNbits(n, sidr2.ipv4))
        	{
        		return sidr1.suffix > sidr2.suffix ? Subset : Superset;
        	}
        	else
        		return Disjoint;

        }

};

void compareWithTextOutput(char* a, char* b)
{
	CIDRComparator comparator;
	CIDRComparator::CIDRComparatorResult ret = comparator.compareCIDR(a, b);
	switch (ret)
	{
	case CIDRComparator::Equals:
		std::cout << "EQUAL" << std::endl;
		break;
	case CIDRComparator::Disjoint:
		std::cout << "DISJOINT" << std::endl;
		break;
	case CIDRComparator::Subset:
		std::cout << "SUBSET" << std::endl;
		break;
	case CIDRComparator::Superset:
		std::cout << "SUPERSET" << std::endl;
		break;
	default:
		std::cout << "Unknown return" << std::endl;
	}
}


int main()
{
	compareWithTextOutput("23.45.67.89:16", "23.45.255.255:16");
	compareWithTextOutput("1.2.3.4:24", "1.2.3.4:16");
	compareWithTextOutput("172.84.26.128:16", "172.84.26.255:24");
	compareWithTextOutput("192.54.16.128:25", "197.54.16.127:25");
	//compareWithTextOutput(CIDRRange(Ipv4(23, 45, 67, 89), 16),		CIDRRange(Ipv4(23, 45, 255, 255), 16));
	//compareWithTextOutput(CIDRRange(Ipv4(1, 2, 3, 4), 24),			CIDRRange(Ipv4(1, 2, 3, 4), 16));
	//compareWithTextOutput(CIDRRange(Ipv4(172, 84, 26, 128), 16),	CIDRRange(Ipv4(172, 84, 26, 255), 24));
	//compareWithTextOutput(CIDRRange(Ipv4(197, 54, 16, 128), 25),	CIDRRange(Ipv4(197, 54, 16, 127), 25));
}
