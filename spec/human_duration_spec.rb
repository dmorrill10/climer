require_relative 'support/spec_helper'

require_relative '../lib/cli_timer/human_duration'
using CliTimer::HumanDuration

describe 'CliTimer::HumanDuration' do
  it '#+ given an English formatted time returns a time given an elapsed time' do
    (Time.new(0) + '2 hours').must_equal Time.new(0, 1, 1, 2)
  end
  it '#- given an English formatted time returns a time given an elapsed time' do
    (Time.new(0, 1, 1, 2) - '2 hours').must_equal Time.new(0)
  end
end