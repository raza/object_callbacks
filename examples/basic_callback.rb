require 'object_callbacks'

class MyClass
  extend ObjectCallbacks

  before_call :before_callback_1, :only => [:action1]
  before_call :before_callback_2, :only => [:action1]
  before_call :before_callback_3, :only => [:action1]
  after_call  :after_call_1, :only => [:action1]

  def action1
    puts 'action1 called'
  end

  def action2
    puts 'action2 called'
  end

  private

  def before_callback_1
    puts 'before_callback_1 called'
  end

  def before_callback_2
    puts 'before_callback_2 called with termination'
    # false
  end

  def before_callback_3
    puts 'before_callback_3 called'
  end

  def after_call_1
    puts 'after_call_1 called'
  end
end

my_class = MyClass.new
my_class.action1
my_class.action2
