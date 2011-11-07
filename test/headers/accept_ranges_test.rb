require 'minitest/spec'
require 'minitest/autorun'

require 'redbot'

describe Redbot::Headers::AcceptRanges do
  it "valid range 'bytes'" do
    header = Redbot::Headers::AcceptRanges.parse('bytes')
    header.value.must_equal 'bytes'
    header.errors.must_be_empty
  end

  it "valid range 'none'" do
    header = Redbot::Headers::AcceptRanges.parse('none')
    header.value.must_equal 'none'
    header.errors.must_be_empty
  end

  it "valid with both accept ranges 'bytes,none'" do
    header = Redbot::Headers::AcceptRanges.parse(['bytes', 'none'])
    header.value.must_equal ['bytes', 'none']
    header.errors.must_be_empty
  end

  it "should test generic header syntax"

  it "should be invalid if an unknown header" do
    header = Redbot::Headers::AcceptRanges.parse('foo')
    header.value.must_equal 'foo'
    header.errors.must_include(Redbot::Headers::AcceptRanges::UNKNOWN_RANGE)
  end

  it "should be valid with mixed case values" do
    header = Redbot::Headers::AcceptRanges.parse(['Bytes', 'NONE'])
    header.value.must_equal ['bytes', 'none']
    header.errors.must_be_empty
  end

end