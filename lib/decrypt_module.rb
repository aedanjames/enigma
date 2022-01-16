module Decrypt
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
