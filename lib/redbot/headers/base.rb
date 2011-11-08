module Redbot::Headers
  module Base

    AGE_NAN = "AGE_NAN"
    AGE_NEGATIVE = "AGE_NEGATIVE"
    SINGLE_HEADER_REPEATED = "SINGLE_HEADER_REPEATED"
    INVALID_DATE_SYNTAX = "INVALID_DATE_SYNTAX"
    UNKNOWN_VALUE = "UNKNOWN_VALUE"
    FUTURE_DATE = "FUTURE_DATE"
    UNKNOWN_RANGE = "UNKNOWN_RANGE"
    INVALID_CACHE_CONTROL_SYNTAX = "INVALID_CACHE_CONTROL_SYNTAX"

    def self.included(base)
      base.send(:attr_accessor, :value, :errors)
      base.send :include, InstanceMethods
    end

    module InstanceMethods
      def alert(error)
        errors.push(error)
      end
    end

  end
end