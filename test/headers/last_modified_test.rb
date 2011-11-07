require 'minitest/spec'
require 'minitest/autorun'

require 'redbot'

describe Redbot::Headers::LastModified do
  it "valid date" do
    header = Redbot::Headers::LastModified.parse('Last-Modified', 'Mon, 04 Jul 2011 09:08:06 GMT')
    header.value.must_equal 1309770486
    header.errors.must_be_empty
  end

  it "future date" do
    header = Redbot::Headers::LastModified.parse('Last-Modified', 'Mon, 04 Jul 2029 09:08:06 GMT')
    header.value.must_equal 1877850486
    header.errors.must_include(Redbot::Headers::LastModified::FUTURE_DATE)
  end

  # it "invalid date" do
  #   result = Redbot::Headers::LastModified.parse('Last-Modified', '')
  #   result.value.must_be_nil
  #   result.errors.must_include(Redbot::BAD_DATE_SYNTAX)
  # end
  # 
  # it "invalid date" do
  #   result = Redbot::Headers::LastModified.parse('Last-Modified', '0')
  #   result.value.must_be_nil
  #   result.errors.must_include(Redbot::BAD_DATE_SYNTAX)
  # end

end