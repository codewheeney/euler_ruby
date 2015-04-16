class PalindromeFactorFinder
{
public:
    PalindromeFactorFinder(unsigned int min, unsigned int max);

    unsigned long long FindBiggestPalindrome();

private:
    bool isPalindrome(unsigned long long candidate);
    bool hasApproprateFactors(unsigned long long candidate);

private:
    unsigned int m_minFactor;
    unsigned int m_maxFactor;
    unsigned long long m_max;
    unsigned long long m_min;
};