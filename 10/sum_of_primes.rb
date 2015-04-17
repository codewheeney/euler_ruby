require_relative '../3/prime_tester'

class SumOfPrimes
  def sumBelow(val)
    primeTester = PrimeTester.new

    sum = 0

    (2..val).each() { |i|
      if primeTester.isPrime(i)
        sum += i
      end
    }

    return sum
  end

end

if __FILE__ == $0
  s = SumOfPrimes.new

  puts "Sum of primes below 10 = #{s.sumBelow(10)}"
  puts "Sum of primes below 2000000 = #{s.sumBelow(2000000)}"
end