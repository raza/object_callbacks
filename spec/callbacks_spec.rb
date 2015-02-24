require 'spec_helper'
require 'object_callbacks'

class MyClass
  extend ObjectCallbacks

  before_call :sit_down
  before_call :drink_one_glass,    :only => [:sleep]
  after_call  :drink_four_glasses, :only => [:wake_up]

  def sleep
    'Go to sleep'
  end

  def wake_up
    'Get up now'
  end

  private

  def drink_one_glass
    'Drink one glass'
  end

  def drink_four_glasses
    'Drink four glasses'
  end

  def sit_down
    'Please sit down'
  end
end

describe ObjectCallbacks do
  subject { MyClass.new }
  describe '#sleep' do
    it 'calls sit_down' do
      expect(subject).to receive(:sit_down)
      subject.sleep
    end

    it 'drinks one glass' do
      expect(subject).to receive(:drink_one_glass)
      subject.sleep
    end

    it 'should not drink four glasses' do
      expect(subject).to_not receive(:drink_four_glasses)
      subject.sleep
    end
  end
end
