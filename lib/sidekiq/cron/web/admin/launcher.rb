require 'sidekiq/cron/launcher'

module Sidekiq
  class Launcher
    # remember old initialize
    alias_method :old_initialize, :initialize

    # add cron poller and execute normal initialize of Sidekiq launcher
    def initialize(options)
      old_initialize options
    end

    # remember old run
    alias_method :old_run, :run

    # execute normal run of launcher and run cron poller
    def run
      old_run
    end

    # remember old quiet
    alias_method :old_quiet, :quiet

    # execute normal quiet of launcher and quiet cron poller
    def quiet
      old_quiet
    end

    # remember old stop
    alias_method :old_stop, :stop

    # execute normal stop of launcher and stop cron poller
    def stop
      old_stop
    end
  end
end
