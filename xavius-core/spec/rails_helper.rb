require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'

# Remove the ActiveRecord constant, because it is autloaded by
# ActiveStorage and not needed for our application. The presence
# of the ActiveRecord constant causes rspec-rails to include
# extra fixture support (see: https://goo.gl/6Ed17Y), which
# results in:
#
#   ActiveRecord::ConnectionNotEstablished:
#     No connection pool with 'primary' found.
#
Object.send(:remove_const, :ActiveRecord)
