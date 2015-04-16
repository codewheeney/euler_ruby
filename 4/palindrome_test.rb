class PalindromeTest

  def initialize(min, max)
    @min = min
    @max = max

    puts "Finding palindromes between #{@min} and #{@max}"
  end

  def FindBiggestPalindrome

    # start at max, reduce by one until we find palindrome
    # representation, then see if we can find 3 digit factors
    (@min..@max).reverse_each { |f|
      if(isPalindrome(f))
        if(hasAppropriateFactors(f))
          return f
        end
      end
    }

    return 0

  end

  private
  def isPalindrome(candidate)
    return candidate.to_s == candidate.to_s.reverse
  end

  def hasAppropriateFactors(candidate)
    puts candidate
  end

end

if __FILE__ == $0

  pt = PalindromeTest.new(100*100, 999*999)

  pt.FindBiggestPalindrome

end