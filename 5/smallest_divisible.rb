require_relative '../3/factorizer'

class SmallestDivisible

  def findSmallestDivisibleByAll(max)

    factorizer = Factorizer.new

    factors = [];

    # - for each value, n, in the set [2..max], find n's prime factors
    # - for each unique factor in n's prime factors
    # -    check that the existing set of all factors contains > number required to factor n
    # -    if it doesn't, add more instances of that prime factor to the all factors up to the count needed to factor n
    #
    (1..max).reverse_each { |n|
      primefactors = factorizer.FindPrimeFactors(n)

      primefactors.uniq.each {|factor|
        countExisting = factors.count(factor)
        countNeeded = primefactors.count(factor)

        if(countNeeded > countExisting)
          missing = countNeeded - countExisting
          (1..missing).each {|ignored|
            factors << factor
          }
        end
      }
    }

    return factors.inject(:*)
  end

end

def testIt(value, tester)
  puts "Smallest value divisible by (1..#{value}) is #{tester.findSmallestDivisibleByAll(value)}"
end

if __FILE__ == $0
  tester = SmallestDivisible.new

  # Note, verify results with code from Euler 3
  testIt(10, tester)  # 2520
  testIt(20, tester)  # 232792560
  testIt(30, tester)  # 2329089562800
  testIt(40, tester)  # 5342931457063200
end