lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sidekiq/cron/web/admin/version'

Gem::Specification.new do |spec|
  spec.name          = 'sidekiq-cron-web-admin'
  spec.version       = Sidekiq::Cron::Web::Admin::VERSION
  spec.authors       = ['Pablo Marti']
  spec.email         = ['pm@chime.com']

  spec.summary       = 'sidekiq-cron web admin.'
  spec.description   = 'Gives sidekiq-cron web admin removing all of the code for running the cron jobs.'
  spec.homepage      = 'https://github.com/1debit/sidekiq-cron-web-admin'
  spec.license       = 'MIT'

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://gemfury.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'sidekiq-cron', '1.1.0'

  spec.add_development_dependency 'bundler', '~> 1.17'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'mocha'
  spec.add_development_dependency 'rack'
  spec.add_development_dependency 'rack-test'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'redis-namespace', '>= 1.5.2'
  spec.add_development_dependency 'shoulda-context'
  spec.add_development_dependency 'test-unit'
end
