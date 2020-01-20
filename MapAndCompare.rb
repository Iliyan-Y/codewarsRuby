def solution(roman)

  key_map = {I:1,V:5,X:10,L:50,C:100,D:500,M:1000,}
  end_results = []
  to_convert = roman.split('')

  to_convert.each_with_index do |first, next_element|
      second = to_convert[next_element+1]
      key_map.each {|key, value|

    if first == key.to_s

      if first == "I" and second =="V"
        puts "#{first}#{second} is mached as 4"
        end_results << 4
        to_convert.delete(second)

      elsif first == "I" and second =="X"
          puts "#{first}#{second} is mached as 9"
          end_results << 9
          to_convert.delete(second)
      else
        puts "#{first} is mached as #{value}"
        end_results << value
      end

    else
      puts "#{first} isn't matching Key -> #{value}"
  end
    }
  end


puts end_results.sum
puts "#{end_results} is "
puts "#{to_convert}"


end

roman = "MXIX"
solution(roman)
