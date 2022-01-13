class Enigma
  attr_reader :char_set
  def initialize
    @char_set = ("a".."z").to_a << " "
  end

  def encrypt(message, key = nil, date = nil)
    require "pry"; binding.pry
    if key == nil then key = rand(99999).to_s.rjust(5, "0")
      a_shift = key.slice(0..1).to_i
      b_shift = key.slice(1..2).to_i
      c_shift = key.slice(2..3).to_i
      d_shift = key.slice(3..4).to_i
    elsif key != nil
      a_shift = key.slice(0..1).to_i
      b_shift = key.slice(1..2).to_i
      c_shift = key.slice(2..3).to_i
      d_shift = key.slice(3..4).to_i
    end
  end
end
