# Xavius Suite
[![Build Status](https://travis-ci.org/xavius-rb/xavius.svg?branch=master)](https://travis-ci.org/xavius-rb/xavius)

## Getting Started
Wondering how to start with Ruby on Rails? Then follow these steps to get you setup appropriately:

- Install and learn a little bit about [Docker](https://docs.docker.com/get-started/)
- Download our custom image: ```docker pull xavius/base```
- Run our image: ```docker run --rm -it -v "$PWD:/usr/src/app" xavius/base```
- The command above will start the terminal inside xavius/base container.
- Install Rails manually: ```gem install rails``` or run ```xavius new [app_name]```. The latter will install latest Rails available and create your app applying a nice-to-have boot template.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'xavius'
```

And then execute:

    $ bundle


Be mindfull this will include the entire Framework for you to work with. You can also include only xavius-core to benefit from embedded CRUD controllers and a well organised action-oriented feature.

## Xavius Core
Xavius component which stores the basic artifacts to make your application RDD. Check out [xavius-core](https://github.com/xavius-rb/xavius/tree/master/xavius-core).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/xavius-rb/xavius. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
