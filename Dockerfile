FROM chimebank/base-ruby:main-2.5

RUN cd /tmp && curl -L --output ghr.tar.gz https://github.com/tcnksm/ghr/releases/download/v0.12.0/ghr_v0.12.0_linux_amd64.tar.gz && \
    tar -xzvf ghr.tar.gz && chmod +x ghr_v0.12.0_linux_amd64/ghr && mv ghr_v0.12.0_linux_amd64/ghr /usr/local/bin/ghr && rm -rf /tmp/*

WORKDIR /gem
COPY Gemfile /gem/Gemfile
COPY Gemfile.lock /gem/Gemfile.lock
COPY sidekiq-cron-web-admin.gemspec /gem/sidekiq-cron-web-admin.gemspec
COPY lib/sidekiq/cron/web/admin/version.rb /gem/lib/sidekiq/cron/web/admin/version.rb

ARG BUNDLE_GITHUB__COM
ARG BUNDLE_GEM__FURY__IO

RUN if [ -z "$BUNDLE_GITHUB__COM" ]; then echo 'Environment variable BUNDLE_GITHUB__COM must be specified. Exiting.'; exit 1; fi && \
    if [ -z "$BUNDLE_GEM__FURY__IO" ]; then echo 'Environment variable BUNDLE_GEM__FURY__IO must be specified. Exiting.'; exit 1; fi && \
    gem update --system && gem install bundler && bundle install --jobs=3 --retry=3 && \
    rm -rf /usr/local/bundle/cache

ARG GIT_BRANCH
ARG GIT_COMMIT_SHA
ARG GIT_COMMITTED_AT

ENV GIT_BRANCH=$GIT_BRANCH
ENV GIT_COMMIT_SHA=$GIT_COMMIT_SHA
ENV GIT_COMMITTED_AT=$GIT_COMMITTED_AT

COPY . /gem
RUN gem build sidekiq-cron-web-admin

CMD ["./bin/test"]
