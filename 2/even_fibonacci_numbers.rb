require_relative 'fib_generator'

if __FILE__ == $0
  fib = FibGenerator.new
  i = 0
  sum = 0

  while
    nextFib = fib.getNthFib(i)

    if nextFib > 4000000 then
      break
    end

    if nextFib % 2 == 0 then
      sum += nextFib
    end

    i += 1
  end

  puts sum

end