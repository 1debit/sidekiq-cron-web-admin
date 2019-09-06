require 'sidekiq'
require 'sidekiq/util'
require 'sidekiq/cron'
require 'sidekiq/scheduled'

module Sidekiq
  module Cron
    POLL_INTERVAL = 30

    class Poller < Sidekiq::Scheduled::Poller
      def enqueue
        raise 'Not allowed'
      end
    end
  end
end
