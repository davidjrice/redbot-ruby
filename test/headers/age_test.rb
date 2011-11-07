require 'minitest/spec'
require 'minitest/autorun'

require 'redbot'

describe Redbot::Headers::Age do

  it "an Integer should be a valid age" do
    header = Redbot::Headers::Age.parse('10')
    header.value.must_equal 10
    header.errors.must_be_empty
  end

  it "should be invalid with multiple age values" do
    header = Redbot::Headers::Age.parse(['10','20'])
    header.value.must_equal 20
    header.errors.must_include(Redbot::Headers::Age::SINGLE_HEADER_REPEATED)
  end

  it "should be invalid if not an Integer" do
    header = Redbot::Headers::Age.parse('foo')
    header.value.must_equal nil
    header.errors.must_include(Redbot::Headers::Age::AGE_NAN)
  end

  it "should be invalid if a negative Integer" do
    header = Redbot::Headers::Age.parse('-1')
    header.value.must_equal -1
    header.errors.must_include(Redbot::Headers::Age::AGE_NEGATIVE)
  end

end