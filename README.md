# ObjectCallbacks

[![Gem Version](https://badge.fury.io/rb/object_callbacks.svg)](http://badge.fury.io/rb/object_callbacks)
[![Build Status](https://travis-ci.org/raza/object_callbacks.svg)](https://travis-ci.org/raza/object_callbacks)
[![Code Climate](https://codeclimate.com/github/raza/object_callbacks/badges/gpa.svg)](https://codeclimate.com/github/raza/object_callbacks)
[![Test Coverage](https://codeclimate.com/github/raza/object_callbacks/badges/coverage.svg)](https://codeclimate.com/github/raza/object_callbacks)

ActiveRecord callbacks with basic functionality, inspired by BeforeFilters [**https://github.com/IDme/before_filters**] gem, in which I have introduced an **after_call** method and performed improvments on the **:only** and **:except** clauses control.

The library allows you to;
* perform pre conditions on object's method.
* perform post conditions on object's method.
* terminate method call in pre conditions just by returning false, similar to ActiveRecord.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'object_callbacks'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install object_callbacks

## Usage

```ruby
class MyClass
  extend ObjectCallbacks

  before_call :sit_down
  before_call :drink_one_glass,    :only => [:sleep]
  after_call  :drink_four_glasses, :only => [:wake_up]

  def sleep
    puts 'Go to sleep'
  end

  def wake_up
    puts 'Get up now'
  end

  private

  def drink_one_glass
    puts 'Drink one glass'
  end

  def drink_four_glasses
    puts 'Drink four glasses'
  end

  def sit_down
    puts 'Please sit down'
  end
end

my_class = MyClass.new

my_class.sleep
=> Please sit down
=> Drink one glass
=> Go to sleep

```

## Contributing

1. Fork it ( https://github.com/raza/object_callbacks/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
