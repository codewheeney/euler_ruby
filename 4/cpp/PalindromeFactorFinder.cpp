#include "stdafx.h"
#include "PalindromeFactorFinder.h"

#include <iostream>
#include <vector>

using namespace std;

PalindromeFactorFinder::PalindromeFactorFinder(unsigned int min, unsigned int max)
:   m_minFactor(min),
    m_maxFactor(max),
    m_max(max*max),
    m_min(min*min)
{
}

unsigned long long PalindromeFactorFinder::FindBiggestPalindrome()
{
    cout << "Looking for palindromes between " << m_min << " and " << m_max << endl;
    for (unsigned long long f = m_max; f >= m_min; --f)
    {
        if (isPalindrome(f))
        {
            if (hasApproprateFactors(f))
            {
                return f;
            }
        }
    }
}

void getDigits(unsigned long long n, vector<short>& digits)
{
    while (n > 0)
    {
        digits.push_back(n % 10);
        n = n / 10;
    }
}

bool PalindromeFactorFinder::isPalindrome(unsigned long long candidate)
{
    vector<short> digits;
    getDigits(candidate, digits);
    size_t len = digits.size();

    for (int i = 0; i < len / 2; ++i)
    {
        if (digits[i] != digits[len - i - 1])
        {
            return false;
        }
    }

    return true;
}

bool PalindromeFactorFinder::hasApproprateFactors(unsigned long long candidate)
{
    for (unsigned int factor = m_maxFactor; factor >= m_minFactor; --factor)
    {
        if (candidate % factor == 0)
        {
            unsigned int otherFactor = candidate / factor;
            if ((m_minFactor <= otherFactor) && (otherFactor <= m_maxFactor))
            {
                cout << candidate << " = " << factor << " * " << otherFactor << endl;
                return true;
            }
        }
    }

    return false;
}
