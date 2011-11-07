require 'minitest/spec'
require 'minitest/autorun'

require 'redbot'

describe Redbot::Headers::Age do

  it "valid date" do
    header = Redbot::Headers::Age.parse('10')
    header.value.must_equal 10
    header.errors.must_be_empty
  end

  it "future date" do
    header = Redbot::Headers::Age.parse(['10','20'])
    header.value.must_equal 20
    header.errors.must_include(Redbot::Headers::Age::SINGLE_HEADER_REPEATED)
  end

  it "future date" do
    header = Redbot::Headers::Age.parse('foo')
    header.value.must_equal nil
  end

end