# Xavius Suite
[![Build Status](https://travis-ci.org/xavius-rb/xavius.svg?branch=master)](https://travis-ci.org/xavius-rb/xavius)

## Getting Started
Wondering how to start with Ruby on Rails? Then follow these steps to get you setup appropriately:
1 - Install and learn a little bit about [Docker](https://docs.docker.com/get-started/)
2 - Download our custom image: ```docker pull xavius/base```
3 - Run our image: ```docker run --rm -it -v "$PWD:/home" xavius/base```
4 - The command above will start the terminal inside xavius/base container.
5 - Install Rails manually: ```gem install rails``` or run ```xavius new [app_name]```. The latter will install latest Rails available and create your app applying a nice-to-have boot template.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'xavius'
```

And then execute:

    $ bundle


## Xavius Core
First Xavius component which stores basic artifacts to make your application RDD. Check [xavius-core](https://github.com/xavius-rb/xavius/tree/master/xavius-core).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/xavius-rb/xavius. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
