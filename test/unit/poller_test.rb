# frozen_string_literal: true

require './test/test_helper'
require 'sidekiq/testing'

describe 'Cron Poller' do
  before do
    Sidekiq::Testing.inline!

    @args = {
      name: 'Test',
      cron: '*/2 * * * *',
      klass: 'CronTestClass'
    }
    @args2 = @args.merge(name: 'with_queue', klass: 'CronTestClassWithQueue',
                         cron: '*/10 * * * *')

    @poller = Sidekiq::Cron::Poller.new
  end

  it 'does not allow to enqueue through the poller' do
    now = Time.now.utc + 3600
    enqueued_time = Time.new(now.year, now.month, now.day, now.hour, 5, 1)
    Time.stubs(:now).returns(enqueued_time)

    assert_raises RuntimeError do
      @poller.enqueue
    end
  end
end
