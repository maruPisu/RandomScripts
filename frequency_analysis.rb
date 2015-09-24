default_path = "file.txt"
path = ""

def count_letters(str)
	lett = Hash[('a'..'z').to_a.zip Array.new(26,0)]

	str.split("").each do |i|
		if (('a'..'z').to_a).any? { |letter| i.include?(letter) }
			lett[i] += 1
		end
	end

	return lett.sort_by{|k,v| v }.reverse
end

system "clear"
print "\n\n --- LETTER COUNTER!! ---\nby Mauro Pisu\n\n"

loop do
	print "insert path of the input file(leave blank for "+ default_path +"): "
	path = gets.to_s
	path = path.chomp

	if path.empty?
		path = default_path
	end

	if !File.exist?(path)
		puts "This file does not exists\n"
	else
		break
	end
end 

text = ""
File.open(path, "r") do |f|
  f.each_line do |line|
    text += line
  end
end
text = (text.downcase).gsub(/\s+/, "")

puts "\nAnalyzing " + path + " ...\n"

ret = count_letters(text.chomp)

print "\n-------\nHere is your sorted output: \n"

zeros = false
zero_str = ""
ret.each do |key, value|
	if value == 0
		zero_str += "#{key}, "
		zeros = true
	else
		puts "#{key}:#{value}"
	end
end
if zeros
	puts zero_str[0..-3] + " = 0"
end