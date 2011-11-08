require 'minitest/spec'
require 'minitest/autorun'

require 'redbot'

describe Redbot::Headers::CacheControl do

  it "valid" do
    header = Redbot::Headers::CacheControl.parse('a=b','c=d', 'e=f', 'g')
    header.value.must_equal [['a', 'b'], ['c', 'd'], ['e', 'f'], ['g', nil]]
    header.errors.must_be_empty
  end

  it "case" do
    header = Redbot::Headers::CacheControl.parse('A=b','c=D')
    header.value.must_equal [['a', 'b'], ['c', 'D']]
    header.errors.must_be_empty
  end
  
  it "quoted" do
    header = Redbot::Headers::CacheControl.parse('a="b,c", c=d')
    header.value.must_equal [['a', 'b,c'], ['c', 'd']]
    header.errors.must_be_empty
  end

  it "max-age" do
    header = Redbot::Headers::CacheControl.parse('max-age=5')
    header.value.must_equal [['max-age', 5]]
    header.errors.must_be_empty
  end

  it "invalid max-age" do
    header = Redbot::Headers::CacheControl.parse('max-age=foo')
    header.value.must_equal []
    header.errors.must_include(Redbot::Headers::CacheControl::INVALID_CACHE_CONTROL_SYNTAX)
  end

end