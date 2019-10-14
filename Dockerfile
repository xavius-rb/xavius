FROM xavius/base

COPY ./xavius-core /home
RUN bundle install

CMD echo 'run and finished'
