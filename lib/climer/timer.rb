require 'rufus-scheduler'
require 'duration'
require 'time_distribution/smart_duration'
require_relative 'human_duration'
using Climer::HumanDuration

module Rufus::Scheduler
  def self.scheduler() @scheduler ||= start_new end
  def self.every(duration)
    job = scheduler.every TimeDistribution::SmartDuration.parse(duration).total do
      yield if block_given?
    end
  end
  def self.at(time)
    job = scheduler.at time do
      yield if block_given?
    end
  end
end

module Climer
class Timer
  class << self; alias_method :alert_in, :new; end

  attr_reader :alert_time

  CARRIAGE_RETURN = "\r"
  def initialize(duration)
    @alert_time = Time.now + duration
    puts "Alert set to activate at #{@alert_time.strftime('%l:%M %p on %B %e, %Y')}"
    print countdown_string

    countdown_update_interval = '1 second'
    job = Rufus::Scheduler.every countdown_update_interval do
      print "#{CARRIAGE_RETURN}#{countdown_string}"
    end

    Rufus::Scheduler.at @alert_time do
      Rufus::Scheduler.scheduler.unschedule(
        job.job_id
      )
      sleep TimeDistribution::SmartDuration.parse(countdown_update_interval).total
      puts ''
      puts "ALERT! Timer expired!"
    end
  end

  def time_remaining
    Duration.new(@alert_time - Time.now)
  end
  def countdown_string
    time_remaining.format('%h:%M:%S')
  end
end
end