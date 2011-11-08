module Redbot::Headers

  class Allow
    include Base

    # rfc "2616", "14.7"
    # name "Allow"
    # 
    # accept :multiple_values
    # accept :values => ["GET", "HEAD", "POST", "PUT", "DELETE"]
    # required :if => response.code == 405

    def self.parse(*values)
      new(values)
    end

    def initialize(values)
      self.errors = []
      if values.kind_of?(String)
        values = [values]
      end

      values.map! {|v| v.upcase }
      values.each do |value|
        if !["GET", "HEAD", "POST", "PUT", "DELETE", "TRACE", "CONNECT"].include?(value)
          alert(UNKNOWN_VALUE)
        end
      end

      self.value = values
      self.value = values.first if values.size == 1
    end

  end
end
