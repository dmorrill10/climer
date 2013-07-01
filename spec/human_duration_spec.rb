require_relative 'support/spec_helper'

require_relative '../lib/climer/human_duration'
using Climer::HumanDuration

describe 'Climer::HumanDuration' do
  it '#+ given an English formatted time returns a time given an elapsed time' do
    (Time.new(0) + '2 hours').must_equal Time.new(0, 1, 1, 2)
  end
  it '#- given an English formatted time returns a time given an elapsed time' do
    (Time.new(0, 1, 1, 2) - '2 hours').must_equal Time.new(0)
  end
end