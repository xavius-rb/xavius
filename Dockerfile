FROM xavius/base

ARG BUNDLE_GEMFILE=Gemfile
ENV BUNDLE_GEMFILE=${BUNDLE_GEMFILE}

COPY . /home
RUN bundle install

CMD echo 'run and finished'
