class PrimeTester

  # from http://en.wikipedia.org/wiki/Primality_test#Ruby_implementation
  def isPrime(n)
    return n > 1 if n <=3
    return false if n % 2 == 0 || n % 3 == 0

    i = 5
    while i*i <= n
      return false if (n % i == 0 || n % (i + 2) == 0)
      i += 6
    end

    true
  end

end


if __FILE__ == $0

    value = 101

    if ARGV.length > 0 then
      value = Integer(ARGV[0])
    end

  tester = PrimeTester.new()

  puts "#{value} #{tester.isPrime(value) ? 'is' : 'is not'} prime"
end