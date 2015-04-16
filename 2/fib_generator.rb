class FibGenerator

  def initialize
    @fibNums = Hash.new()
    @fibNums[0] = 0
    @fibNums[1] = 1
  end

  def getNthFib(n)

    if(@fibNums.include?(n))
      return @fibNums[n]
    end

    generateImpl(n)

    return @fibNums[n]
  end

  private
  def generateImpl(n)
    (n - 1).times do |i|
      @fibNums[i + 2] = @fibNums[i + 1] + @fibNums[i]
    end
  end

end

if __FILE__ == $0
  fib = FibGenerator.new

  puts fib.getNthFib(8)

  (0..8).each {|n| puts "#{n},#{fib.getNthFib(n)}" }
end