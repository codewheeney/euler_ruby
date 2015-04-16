class PalindromeTest

  def initialize(min, max)
    @minFactor = min
    @maxFactor = max
    @min = min * min
    @max = max * max

    puts "Finding palindromes between #{@min} and #{@max}"
  end

  def FindBiggestPalindrome

    # start at max, reduce by one until we find palindrome
    # representation, then see if we can find 3 digit factors
    (@min..@max).reverse_each { |f|
      if(isPalindrome2(f))
        if(hasAppropriateFactors(f))
          return f
        end
      end
    }

    return 0

  end

  private

  # speed here doesn't matter for 3 digit factors.  4 digit factors
  # show this to be too slow, and isPalindrome2 to be fastest.
  # 5 digit (10000, 99999) is to much, and the ruby process is killed -9
  def isPalindrome(candidate)
    stringy = candidate.to_s
    return stringy == stringy.reverse
  end

  def digits(n)

    # reverse order, but that's ok for our test.
    ary = []
    while n > 0
      ary << n % 10
      n /= 10
    end

    return ary
  end

  def isPalindrome2(candidate)
    ary = digits(candidate)

    return ary == ary.reverse
  end

  def isPalindrome3(candidate)
    ary = digits(candidate)

    len = ary.length
    for i in 0..(len/2) do
      if ary[i] != ary[len - i - 1] then
        return false
      end
    end

    return true;
  end

  def hasAppropriateFactors(candidate)
    (@minFactor..@maxFactor).reverse_each { |factor|
      if candidate % factor == 0 then
        otherFactor = candidate / factor
        if (@minFactor <= otherFactor) && (otherFactor <= @maxFactor) then
          puts "#{candidate} = #{factor} * #{candidate/factor}"
          return true
        end
      end
    }

    return false
  end

end

if __FILE__ == $0

  min = 100
  max = 999

  if ARGV.length > 1 then
    min = Integer(ARGV[0])
    max = Integer(ARGV[1])
  end

  pt = PalindromeTest.new(min, max)

  puts Time::now
  pt.FindBiggestPalindrome
  puts Time::now

end