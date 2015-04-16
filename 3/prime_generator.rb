class PrimeGenerator
  # use a sieve of Eratosthenes to generate primes
  # up to a value

  def initialize(max)
    @maxValue = max
  end

  def generatePrimesTooMuchSpace( stream )

    a = Hash.new(true)

    (2..Math.sqrt(@maxValue)).each do |i|
      if a[i] == true then
        j = i * i
        while j <= @maxValue do
          a[j] = false
          j = j + i
        end
      end
    end

    (1..@maxValue).each do |i|
      if a[i] then
        stream << i << ','
      end
    end
  end

  def generatePrimesArray( stream )

    a = Array.new(@maxValue, true)

    (2..Math.sqrt(@maxValue)).each do |i|
      if a[i] == true then
        j = i * i
        while j <= @maxValue do
          a[j] = false
          j = j + i
        end
      end
    end

    (1..@maxValue).each do |i|
      if a[i] then
        stream << i << ','
      end
    end
  end
end


if __FILE__ == $0

  max = 10

  if ARGV.length > 0 then
    max = Integer(ARGV[0])
  end

  gen = PrimeGenerator.new(max)

  gen.generatePrimesArray(STDOUT)
end