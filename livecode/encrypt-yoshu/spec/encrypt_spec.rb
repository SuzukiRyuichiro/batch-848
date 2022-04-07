# frozen_string_literal: true

require_relative '../encrypt'

describe '#encrypt' do
  it 'should return empty string when passed an empty string' do
    expected = ''
    actual = encrypt('')
    expect(expected).to eq(actual)
  end

  it 'should encrypt the message 3-letter backward-shifted' do
    actual = encrypt('THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG')
    expected = 'QEB NRFZH YOLTK CLU GRJMP LSBO QEB IXWV ALD'
    expect(expected).to eq(actual)
  end
end
