class Stringify
	less_twenty = ["","one","two","three","four","five","six","seven","eight","nine","ten","eleven","twelve","thirteen","fourteen","fifteen","sixteen","seventeen","eighteen","nineteen"]
	tens = ["","","twenty","thirty","forty","fifty","sixty","seventy","eighty","ninety"]
	words = ["zero", " hundred ", " thousand ", " million ", " billion "]


	define_method (:compute) do |num|
		ret = ""
		if num == 0
			return words[0]
		end

		if num > 999999999999
			return "too big.. try another one"
		end

		reference = 1000000000
		current_word = 4

		while num >= 1000 do
			if num >= reference
				bill = (num / reference).floor
				ret += three_digits(bill) + words[current_word]
				num = num % reference
			end
			current_word -= 1
			reference /= 1000
		end
		ret += three_digits(num)
		return ret
	end

	define_method (:three_digits) do |num|
		ret = ""
		hund = (num / 100).floor
		two_d = num % 100
		if hund > 0
			ret = less_twenty[hund] + words[1]
		end
		if two_d < 20 
			ret += less_twenty[two_d]
		else
			dec = (two_d / 10).floor
			uni = two_d % 10
			ret += tens[dec] + " " +less_twenty[uni]
		end
		return ret
	end
end
print "\n\n --- Stringify your number!! ---\nby Mauro Pisu\n\n"
print "insert number: "
number = gets.to_i

print "your number is: "
str = Stringify.new
print str.compute(number)
print "\n\n"