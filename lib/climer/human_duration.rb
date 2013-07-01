require 'chronic_duration'

module Climer
module HumanDuration
  refine Time do
    alias_method :old_plus, :+
    alias_method :old_minus, :-

    def +(other)
      old_plus(ChronicDuration.parse(other) || other)
    end
    def -(other)
      old_minus(ChronicDuration.parse(other) || other)
    end
  end
end
end