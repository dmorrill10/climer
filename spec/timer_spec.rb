require_relative 'support/spec_helper'
require 'timecop'

require_relative '../lib/climer/timer'

describe 'Climer::Timer' do
  describe '#alert_in' do
    it 'should show the end time' do
      Timecop.freeze Time.new(0)
      time_at_alert = Time.new(0) + 60*60
      -> { Climer::Timer.alert_in('1 hour') }.must_output(
        "Alert set to activate at #{time_at_alert.strftime('%l:%M %p on %B %e, %Y')}\n" <<
        "1:00:00"
      )
    end
  end
end