module Redbot::Headers

  class Age
    include Base

    def self.parse(values)
      new(values)
    end

    def initialize(values)
      self.errors = []
      if values.kind_of?(Array)
        alert(SINGLE_HEADER_REPEATED)
        self.value = values.pop
      else
        self.value = values
      end
      begin
        self.value = Integer(value)
        if value < 0
          alert(AGE_NEGATIVE)
        end
      rescue ArgumentError => e
        self.value = nil
        alert(AGE_NAN)
      end
    end

  end

end
