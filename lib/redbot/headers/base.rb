module Redbot::Headers
  class Base
    cattr_accessor :value, :errors

    AGE_NAN = "AGE_NAN"

    AGE_NEGATIVE = "AGE_NEGATIVE"

    SINGLE_HEADER_REPEATED = "SINGLE_HEADER_REPEATED"

    INVALID_DATE_SYNTAX = "INVALID_DATE_SYNTAX"


    UNKNOWN_VALUE = "UNKNOWN_VALUE"

    FUTURE_DATE = "FUTURE_DATE"

    UNKNOWN_RANGE = "UNKNOWN_RANGE"

    INVALID_CACHE_CONTROL_SYNTAX = "INVALID_CACHE_CONTROL_SYNTAX"


    def errors
      @errors ||= []
    end

    def alert(error)
      errors.push(error)
    end

  end
end