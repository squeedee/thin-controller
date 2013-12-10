require 'action_controller'

module ThinController
  class Base < ActionController::Base

    def self.build_controller(namespaced_controller_name)
      names = namespaced_controller_name.split("::")
      controller_name = names.pop

      namespace = names.inject(Object) do |namespace_memo, name|
        if namespace_memo.const_defined?(name)
          namespace_memo.const_get(name)
        else
          namespace_memo.const_set(name, Module.new)
        end
      end

      namespace.const_set(controller_name, Class.new(self))
    end

    #def method_for_action(action_name)
    #  command = find_command(action_name)
    #  return super unless command
    #
    #  build_command_proxy(action_name, command)
    #  action_name
    #end
    #
    #private
    #
    #def build_command_proxy(action_name, command_constant)
    #  class_eval <<-CLASS
    #      def #{action_name}
    #        command = #{command_constant}.new(params,request)
    #      end
    #  CLASS
    #end
    #
    #def find_command(action_name)
    #
    #end

  end
end
