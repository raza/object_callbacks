# ObjectCallbacks

[![Gem Version](http://img.shields.io/gem/v/twitter.svg)][gem]

Similar to BeforeFilters [**https://github.com/IDme/before_filters**] but more than that.
Similar to BeforeFilters [**https://github.com/IDme/before_filters**] but more than that, simple functionality than ActiveRecord's callbacks.

The library allows you to bind before_call and after_call to a Ruby class method, similar to ActiveRecord's callbacks.
The library allows you to bind before_call and after_call to a Ruby class method, similar to ActiveRecord's callbacks.

Similar to ActiveRecord, if you need to termiate execution in before_call just return false.

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
  before_call :drink_one_glass,    only: [:sleep]
  after_call  :drink_four_glasses, only: [:wake_up]

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
