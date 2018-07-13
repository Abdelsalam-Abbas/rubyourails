class CounterJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
      21 + 21 + 27
  end
end
