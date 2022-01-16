require './lib/enigma'

@enigma = Enigma.new

input = ARGV[0]
output = ARGV[1]

incoming_text = File.new(input).read
hash_output = @enigma.encrypt(incoming_text)

File.open(output, "w") do |file|
  file.puts hash_output[:encryption]
  puts "created #{output} with key #{hash_output[:key]}, and date #{hash_output[:date]}"
end
