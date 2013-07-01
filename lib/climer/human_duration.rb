require 'time_distribution/smart_duration'

module Climer
module HumanDuration
  refine Time do
    alias_method :old_plus, :+
    alias_method :old_minus, :-

    def +(other)
      old_plus(
        if other.kind_of?(String)
          TimeDistribution::SmartDuration.parse(other).total || other
        else
          other
        end
      )
    end
    def -(other)
      old_minus(
        if other.kind_of?(String)
          TimeDistribution::SmartDuration.parse(other).total || other
        else
          other
        end
      )
    end
  end
end
end