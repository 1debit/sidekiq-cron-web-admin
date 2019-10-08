# Sidekiq::Cron::Web::Admin

Removes the logic for enqueuing the workers on Cron, just keeps the web UI Admin and the funcionality for enqueuing the workers manually from the Admin.

This repository is a fork of https://github.com/ondrejbartas/sidekiq-cron where it overwrites the Poller class in charge of enqueuing the workers automatically;
it also overwrites the Launcher so it should not make any call to the Poller (https://github.com/1debit/sidekiq-cron-web-admin/tree/master/lib/sidekiq/cron).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sidekiq-cron-web-admin'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sidekiq-cron-web-admin

## Development

1 - Clone this repository
2 - Setup the .env file using the .env.example
3 - Run `bundle`
4 - Update the files at lib, and if needed to overwrite files from https://github.com/ondrejbartas/sidekiq-cron copy/paste the files into `lib/` and update them (see the examples https://github.com/1debit/sidekiq-cron-web-admin/tree/master/lib/sidekiq/cron)
5 - Add tests using `test-unit` and run the tests: `bundle exec rake test`
6 - Push the changes to the branch and create a PR


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/1debit/sidekiq-cron-web-admin.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
