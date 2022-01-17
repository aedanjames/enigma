require './lib/enigma'

@enigma = Enigma.new

input = ARGV[0]
output = ARGV[1]
key = ARGV[2]
date = ARGV[3]

hash_output = @enigma.decrypt(File.read(input), key, date)

File.open(output, "w") do |file|
  file.puts hash_output[:decryption]
  puts "created #{output} with the key #{hash_output[:key]}, and date #{hash_output[:date]}"
end
