plaintext = "yzy zyz"
key = ""
cyphertext = ""
cypher = true
default_path = "key.txt"
path = ""

class String
	def char_at(num)
		return self[num, num+1]
	end
end

def sum_chars(char1, char2, cypher)

	pl = char1.ord - 97
	ke = char2.ord - 97
	if pl < 0 || pl > 26 || ke < 0 || ke > 26
		return "-"
	end
	if cypher
		val = (pl + ke+1) % 26 + 97
	else
		val = (pl - ke-1) % 26 + 97
	end
	return val.chr
end
system "clear"
print "\n\n --- VORONOI CYPHER!! ---\nby Mauro Pisu\n\n"

print "insert the text to cypher: "
plaintext = gets.to_s
#remove blank spaces and downcase the entire string
plaintext = (plaintext.downcase).gsub(/\s+/, "")	

loop do
	print "insert path of the key file(leave blank for "+ default_path +"): "
	path = gets.to_s

	if path.empty? || path == "\n"
		path = default_path
	end

	if !File.exist?(path)
		puts "This file does not exists\n"
	else
		break
	end
end 

File.open(path, "r") do |f|
  f.each_line do |line|
    key += line
    if key.length > plaintext.length
    	break
    end
  end
end
key = (key.downcase).gsub(/\s+/, "")
if key.length > plaintext.length
	key = key[0,plaintext.length]
end

print "if you want to cypher press enter, if you want to decypher write 'no': "
resp = gets.to_s
if resp != "\n"
	cypher = false
end

index = 0
plaintext.split("").each do |i|
	cyphertext += sum_chars(i, key.char_at(index), cypher)
	index += 1
	if index == key.length
		index = 0
	end
end

puts "\n---------\n\nYour cyphertext is: " + cyphertext + "\n\n"
