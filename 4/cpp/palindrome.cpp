// palindrome.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include "PalindromeFactorFinder.h"

int _tmain(int argc, _TCHAR* argv[])
{
    if (argc != 3)
    {
        return 0;
    }

    unsigned int min = _tcstoul(argv[1], nullptr, 10);
    unsigned int max = _tcstoul(argv[2], nullptr, 10);

    PalindromeFactorFinder f(min, max);
    f.FindBiggestPalindrome();

    return 0;
}

