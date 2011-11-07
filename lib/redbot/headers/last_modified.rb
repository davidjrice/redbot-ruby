require 'time'
module Redbot
  module Headers
    class LastModified
      # TODO
      # - parse as a single field value
      # - date syntax validation
      # - ensure date is not future
      FUTURE_DATE = "FUTURE_DATE"

      attr_accessor :value, :errors

      def self.parse(header, values)
        new(header, values)
      end

      def errors
        @errors ||= []
      end

      def alert(error)
        errors.push(error)
      end

      def initialize(header, values)
        if values.kind_of?(Array)
          alert(SINGLE_HEADER_REPEATED)
          self.value = values.unshift
        elsif values.kind_of?(String)
          self.value = values
        end
        begin
          self.value = Time.httpdate(value).to_i
          alert(FUTURE_DATE) if value > Time.now.to_i
        rescue ArgumentError => e
          value = nil
          alert(INVALID_DATE_SYNTAX)
        end
      end

    end
  end
end

# @rh.SingleFieldValue
# def parse(name, values, red):
#     try:
#         date = rh.parse_date(values)
#     except ValueError:
#         red.set_message(name, rs.BAD_DATE_SYNTAX)
#         return None
#     if date > red.res_ts:
#         red.set_message(name, rs.LM_FUTURE)
#         return date
#     else:
#         red.set_message(name, rs.LM_PRESENT,
#           last_modified_string=rh.relative_time(date, red.res_ts))
#     return date
# 
# 
# 