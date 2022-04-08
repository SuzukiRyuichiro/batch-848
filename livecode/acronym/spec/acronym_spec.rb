require_relative '../acronym'

describe "#acronymize" do
  it "should return 'WFH' when given 'Work from home'" do
    expected = 'WFH'
    actual = acronymize('Work from home')
    expect(actual).to eq(expected)
  end

  it "should return 'TDD' when given 'Test driven development'" do
    expected = 'TDD'
    actual = acronymize('Test driven development')
    expect(actual).to eq(expected)
  end

  it "should return empty string when given an empty string" do
    expected = ''
    actual = acronymize('')
    expect(actual).to eq(expected)
  end
end
