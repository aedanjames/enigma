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
    offset_array = []
    offset = (date.to_i ** 2).to_s.slice(-4..-1).to_i
  end

  def todays_date
    date = Date.today.strftime("%m%d%y")
  end

  def encrypt(message, key = key_generator, date = todays_date)
    encrypted_message = []
    offset = offset(date) # 1025
    offset_array = offset.to_s.split(//) # ["1", "0", "2", "5"]
    message_array = message.split(//) # ["h" "e" "l" "l" "o" " " "w" "o" "r" "l" "d"]
    key = key.to_s
    a_key = key.slice(0..1).to_i #02
    b_key = key.slice(1..2).to_i #27
    c_key = key.slice(2..3).to_i #71
    d_key = key.slice(3..4).to_i #15
    message_array.each_with_index do |char, index|
      if index % 4 == 0
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
end
