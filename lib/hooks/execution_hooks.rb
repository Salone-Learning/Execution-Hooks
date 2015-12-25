require "hooks/execution_hooks/version"

# Provides before_action method which allows a method and related Hook to be configured for
# any class/module which extends it. Provided Hook will be invoked before the provided
# class/module method. Implementation of Hook needs to be provided by the extending
# class/module. This module can invoke Hooks on class/module level methods as well as instance
# level methods.

module Hooks
  module ExecutionHooks
    def before_action(hook, *method_names)
      method_names.each do |method_name|
        if singleton_methods.include? method_name
          enhance_singleton_method(hook, method_name)
        elsif instance_methods.include? method_name
          enhance_instance_method(hook, method_name)
        end
      end
    end

    private

    def enhance_singleton_method(hook, method_name)
      method = method(method_name)
      define_singleton_method(method_name) do |*args, &block|
        method(hook).call(*args)
        method.call(*args, &block)
      end
    end

    def enhance_instance_method(hook, method_name)
      method = instance_method(method_name)
      define_method(method_name) do |*args, &block|
        method(hook).call(*args)
        method.bind(self).(*args, &block)
      end
    end
  end

  def self.included(base)
    base.send(:extend, Hooks::ExecutionHooks)
  end
end

