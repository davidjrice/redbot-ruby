require 'time'
require 'active_support/all'

require "redbot/version"
require "redbot/headers"

module Redbot

  class << self

    DATE = /(?:\w{3},\ [0-9]{2}\ \w{3}\ [0-9]{4}\ [0-9]{2}:[0-9]{2}:[0-9]{2}\ GMT )|(\w{6,9},\ [0-9]{2}\-\w{3}\-[0-9]{2}\ [0-9]{2}:[0-9]{2}:[0-9]{2}\ GMT)|(\w{3}\ \w{3}\ [0-9 ][0-9]\ [0-9]{2}:[0-9]{2}:[0-9]{2}\ [0-9]{4})/

  end

end
