# Make methods into modules? So each file has one job?
require 'date'
class Enigma
  attr_reader :char_set
  def initialize
    @char_set = ("a".."z").to_a << " "
  end

  def key_generator
    key = rand(99999).to_s.rjust(5, "0")
  end

  def offset(date)
    offset = (date.to_i ** 2).to_s.slice(-4..-1).to_i
  end

  def todays_date
    date = Date.today.strftime("%m%d%y")
  end

  def encrypt(message, key = key_generator, date = todays_date)
    offset = offset(date) # 1025
    offset_array = offset.to_s.split(//) # ["1", "0", "2", "5"]
    message.downcase!
    message_array = message.split(//) # ["h" "e" "l" "l" "o" " " "w" "o" "r" "l" "d"]
    encrypted_message = []
    key = key.to_s
    a_key = key.slice(0..1).to_i #02
    b_key = key.slice(1..2).to_i #27
    c_key = key.slice(2..3).to_i #71
    d_key = key.slice(3..4).to_i #15
    message_array.each_with_index do |char, index|
      if char == "\n"
        message_array.delete(char)
      elsif @char_set.include?(char) == false
        encrypted_message << char
      elsif index % 4 == 0
        position_a = @char_set.rotate(a_key + offset_array[0].to_i)[@char_set.index(char)] #3
          encrypted_message << position_a
      elsif index % 4 == 1
        position_b = @char_set.rotate(b_key + offset_array[1].to_i)[@char_set.index(char)] #27
          encrypted_message << position_b
      elsif index % 4 == 2
        position_c = @char_set.rotate(c_key + offset_array[2].to_i)[@char_set.index(char)] #73
          encrypted_message << position_c
      elsif index % 4 == 3
        position_d = @char_set.rotate(d_key + offset_array[3].to_i)[@char_set.index(char)] #20
          encrypted_message << position_d
      end
    end
    encrypted_result = {
      encryption: encrypted_message.join,
      key: key,
      date: date
    }
    encrypted_result
  end

  def decrypt(message, key, date = todays_date)
    offset = offset(date)
    offset_array = offset.to_s.split(//)
    message_array = message.split(//)
    decrypted_message = []
    key = key.to_s
    a_key = key.slice(0..1).to_i
    b_key = key.slice(1..2).to_i
    c_key = key.slice(2..3).to_i
    d_key = key.slice(3..4).to_i
    message_array.each_with_index do |char, index|
      # multiply rotation by -1 to reverse previous rotation, then call the index of each character
      if char == "\n" then message_array.delete(char)
      elsif @char_set.include?(char) == false
        decrypted_message << char
      elsif index % 4 == 0
        position_a = @char_set.rotate((a_key + offset_array[0].to_i) * -1)[@char_set.index(char)]
          decrypted_message << position_a
      elsif index % 4 == 1
        position_b = @char_set.rotate((b_key + offset_array[1].to_i) * -1)[@char_set.index(char)]
          decrypted_message << position_b
      elsif index % 4 == 2
        position_c = @char_set.rotate((c_key + offset_array[2].to_i) * -1)[@char_set.index(char)]
          decrypted_message << position_c
      elsif index % 4 == 3
        position_d = @char_set.rotate((d_key + offset_array[3].to_i) * -1)[@char_set.index(char)]
          decrypted_message << position_d
      end
    end
    decrypted_result = {
      decryption: decrypted_message.join,
      key: key,
      date: date
    }
    decrypted_result
  end
end
