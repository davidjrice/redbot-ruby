module Redbot
  module Headers
    class Age

      attr_accessor :value, :errors

      AGE_NAN = "AGE_NAN"

      AGE_NEGATIVE = "AGE_NEGATIVE"

      SINGLE_HEADER_REPEATED = "SINGLE_HEADER_REPEATED"

      INVALID_DATE_SYNTAX = "INVALID_DATE_SYNTAX"

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
end
