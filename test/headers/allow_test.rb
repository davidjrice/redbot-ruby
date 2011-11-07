require 'minitest/spec'
require 'minitest/autorun'

require 'redbot'

describe Redbot::Headers::Allow do
  it "valid with a single value 'GET'" do
    header = Redbot::Headers::Allow.parse('GET')
    header.value.must_equal 'GET'
    header.errors.must_be_empty
  end

  it "valid with multiple values" do
    header = Redbot::Headers::Allow.parse('GET', 'PUT', 'POST', 'DELETE')
    header.value.must_equal ['GET', 'PUT', 'POST', 'DELETE']
    header.errors.must_be_empty
  end

  it "invalid with an unknown HTTP method" do
    header = Redbot::Headers::Allow.parse('FOO')
    header.value.must_equal 'FOO'
    header.errors.must_include(Redbot::Headers::Allow::UNKNOWN_VALUE)
  end

  it "should be valud with a mixed case HTTP method" do
    header = Redbot::Headers::Allow.parse('Get')
    header.value.must_equal 'GET'
    header.errors.must_be_empty
  end

  it "should test generic header syntax"

end