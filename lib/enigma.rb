class Enigma
  attr_reader :char_set
  def initialize
    @char_set = ("a".."z").to_a << " "
  end

  def key_generator
    key = rand(99999).to_s.rjust(5, "0")
    a_key = key.slice(0..1).to_i
    b_key = key.slice(1..2).to_i
    c_key = key.slice(2..3).to_i
    d_key = key.slice(3..4).to_i
  end

  def encrypt(message, key = nil, date = nil)
    encrypted_result = {}
    if key == nil then key_generator
    else
      key = key.to_s
      a_key = key.slice(0..1).to_i
      b_key = key.slice(1..2).to_i
      c_key = key.slice(2..3).to_i
      d_key = key.slice(3..4).to_i
    end
  end
end
