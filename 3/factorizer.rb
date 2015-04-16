require_relative 'prime_tester'

class Factorizer

  def initialize
    @primeTester = PrimeTester.new
  end

  def FindPrimeFactors(value)
    if(@primeTester.isPrime(value))
      return [1,value]
    end

    # build a factorization tree.  Find the largest
    # Prime factor of the value, add it and the remainder,
    # recurse on the remainder
    factors = []
    factorImpl(value, factors)

    return factors
  end

  private
  def factorImpl(value, factors)

    # Build a factor tree, start with the
    # square root of the value
    max = Math.sqrt(value).floor

    # find the first value less than the
    # max that is a divisor of the value
    (2..max).reverse_each { |f|

      if(value % f == 0) then

        remainder = value/f

        # f divides value evenly, add it if it
        # is a prime number, or factor it further
        if(@primeTester.isPrime(f)) then
          factors << f
        else
          factorImpl(f, factors)
        end

        # process the other side of the tree, if it's
        # prime, we're done, otherwise, recurse
        if(@primeTester.isPrime(remainder))
          factors << remainder
          return
        else
          return factorImpl(remainder, factors)
        end
      end
    }
  end

end

def factorIt(enfactorator, value, expectedFactors)

  returnedValues = enfactorator.FindPrimeFactors(value);

  if(returnedValues.sort != expectedFactors.sort) then
    puts "Factored #{value}, expected #{expectedFactors.sort}, got #{returnedValues.sort}"
  else
    puts "Factored #{value} successfully, factors are #{returnedValues.sort}"
  end
end

if __FILE__ == $0
  #value = 102 # [2,3,17]
  value = 147 # [7,7,3]
  # value = 13195 # Prime factors are [ 5, 7, 13, 29]

  if ARGV.length > 0 then
    value = Integer(ARGV[0])
  end

  enfactorate = Factorizer.new

  factors = enfactorate.FindPrimeFactors(value)

  puts "The prime factors of #{value} are #{factors.sort}"

  factorIt(enfactorate, 68, [2, 2, 17])
  factorIt(enfactorate, 102, [2,3,17])
  factorIt(enfactorate, 147, [3,7,7])
  factorIt(enfactorate, 13195, [5,7,13,29])
  factorIt(enfactorate, 600851475143, [71, 839, 1471, 6857])

end