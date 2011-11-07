module Redbot::Headers
  class AcceptRanges

    UNKNOWN_RANGE = "UNKNOWN_RANGE"

    attr_accessor :value, :errors

    def self.parse(values)
      new(values)
    end

    def errors
      @errors ||= []
    end

    def alert(error)
      errors.push(error)
    end

    def initialize(values)
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