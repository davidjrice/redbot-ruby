module Redbot::Headers
  class AcceptRanges
    include Base

    def self.parse(values)
      new(values)
    end

    def initialize(values)
      self.errors = []
      if values.kind_of?(String)
        values = [values]
      end

      values = values.map {|v| v.downcase }
      values.each do |value|
        if !['bytes', 'none'].include?(value)
          alert(UNKNOWN_RANGE)
        end
      end
      self.value = values
      self.value = values.first if values.size == 1
    end

  end
end