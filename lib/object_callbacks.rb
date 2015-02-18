require "object_callbacks/version"

module ObjectCallbacks
  def method_added(action_name)
    if actions.include?(action_name) || before_calls.key?(action_name) || after_calls.key?(action_name)
      return
    end

    apply_callback_actions(action_name)
  end

  def before_call(action_name, options = {})
    before_calls[action_name] = options
  end

  def after_call(action_name, options = {})
    after_calls[action_name] = options
  end

  private

  def before_calls
    @before_calls ||= {}
  end

  def after_calls
    @after_calls ||= {}
  end

  def actions
    @actions ||= []
  end

  def apply_callback_actions(action_name)
    actions << action_name

    original_method = instance_method(action_name)

    define_method(action_name) do |*args, &block|
      val = self.class.send(:execute_before_calls, action_name, self)
      return false if val == false
      result = original_method.bind(self).call(*args, &block)
      self.class.send(:execute_after_calls, action_name, self)

      result
    end
  end

  def execute_before_calls(action_name, instance)
    callbacks_for_method(action_name, :before).each do |before_call_method|
      val = instance.send(before_call_method)
      return false if val == false
    end
  end

  def execute_after_calls(action_name, instance)
    callbacks_for_method(action_name, :after).each do |after_call_method|
      instance.send(after_call_method)
    end
  end

  def callbacks_for_method(action_name, callback_type)
    callbacks = send("#{callback_type}_calls")

    callbacks_for_all(callbacks) +
      only_callbacks(callbacks, action_name) +
      except_callbacks(callbacks, action_name)
  end

  def callbacks_for_all(callbacks)
    callbacks.select { |_key, value| value.empty? }.keys
  end

  def only_callbacks(callbacks, action_name)
    callbacks.select do |_key, value|
      !value[:only].nil? && value[:only].include?(action_name)
    end.keys
  end

  def except_callbacks(callbacks, action_name)
    callbacks.select do |_key, value|
      !value[:except].nil? && !value[:except].include?(action_name)
    end.keys
  end
end
