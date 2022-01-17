require './lib/encrypt_module'
require './lib/decrypt_module'
require 'date'

class Enigma
  include Encrypt
  include Decrypt
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
end
