require 'spec_helper'
require './lib/enigma'

RSpec.describe Enigma do
  before(:each) do
    @enigma = Enigma.new
  end

  it 'exists' do
  expect(@enigma).to be_a(Enigma)
  end
end
