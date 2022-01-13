require 'spec_helper'
require './lib/enigma'
require 'date'

RSpec.describe Enigma do
  before(:each) do
    @enigma = Enigma.new
  end

  it 'exists' do
  expect(@enigma).to be_a(Enigma)
  end

  it 'has an attribute(char_set)' do
  expect(@enigma.char_set.count).to eq(27)
  end

  it '#key_generator' do
  expect(@enigma.key_generator).to be_a(Integer)
  end

# encrypt a message with a key and a date
  it '#encrypt' do
    actual = @enigma.encrypt("hello world", 02715, "040895")
    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }
    expect(actual).to eq(expected)
  end

  xit '#decrypt' do
    @enigma.encrypt("hello world", 02715, "040895")
    actual = @enigma.decrypt("keder ohulw", "02715", "040895")
    expected = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }
    expect(actual).to eq(expected)
  end

  xit '#decrypt a message with a key (todays date)' do

  end
end
