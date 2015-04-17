class LargestProductSeries

  def initialize(file)

    @sequence = []

    File.open(file) do |file|
      file.map do |line|
        line.strip().each_char do |char|
          @sequence << Integer(char)
        end
      end
    end
  end

  def findLargestProduct(length)
    # move through the array in length based slices, calculate and keep max
    # (too brute force?)  Doesn't appear to be.
    maxVal = 0
    sequence = []

    (1..(@sequence.length - length)).each {|i|
      subArray = @sequence.slice(i, length)
      val = subArray.inject(:*)
      if val > maxVal then
        maxVal = val
        sequence = subArray
      end
    }

    return sequence
  end

end

def testIt(lps, length, expected)
  generated = lps.findLargestProduct(length)

  if generated.sort == expected.sort then
    puts "Largest product series of length #{length} is #{generated}, product = #{generated.inject(:*)}"
  else
    puts "Error generating for length #{length}, got #{generated}, expected = #{expected}"
  end
end

if __FILE__ == $0
  lps = LargestProductSeries.new('./data')

  testIt(lps, 4, [9,9,8,9])

  ary = lps.findLargestProduct(13)
  puts "#{ary} = #{ary.inject(:*)}"
end