module Redbot::Headers
  class LastModified
    include Base
    # TODO
    # - parse as a single field value
    # - date syntax validation
    # - ensure date is not future

    def self.parse(header, values)
      new(header, values)
    end

    def initialize(header, values)
      self.errors = []
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