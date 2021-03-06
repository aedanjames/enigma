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
    expect(@enigma.key_generator.length).to eq(5)
  end

  it '#todays_date' do
    actual = @enigma.todays_date
    expect(@enigma.todays_date).to be_a(String)
  end

  it '#offset' do
    expect(@enigma.offset("040895")).to eq(1025)
  end

  it '#encrypt' do
    actual = @enigma.encrypt("HELLO world", "02715", "040895")
    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }
    expect(actual).to eq(expected)
  end

  it 'can encrypt with todays_date/generated key' do
    expected = @enigma.encrypt("PIzza for LiFe")
    expect(expected).to be_a(Hash)
  end

  it 'can delete "\n" generated from encryption/decryption' do
    actual = @enigma.encrypt("HELLO world\n", "02715", "040895")
    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }
    expect(actual).to eq(expected)
  end

  it 'can retain special characters in correct position' do
    actual = @enigma.encrypt("HELLO, world", "02715", "040895")
    expected = {
      encryption: "keder,sprrdx",
      key: "02715",
      date: "040895"
    }
    expect(actual).to eq(expected)
    actual_2 = @enigma.decrypt("keder,sprrdx", "02715", "040895")
    expected_2 = {
      decryption: "hello, world",
      key: "02715",
      date: "040895"
    }
  end

  it '#decrypt' do
    @enigma.encrypt("hello world", 02715, "040895")
    actual = @enigma.decrypt("keder ohulw", "02715", "040895")
    expected = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }
    expect(actual).to eq(expected)
  end
end
