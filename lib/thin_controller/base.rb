require 'action_controller'

module ThinController
  class Base < ActionController::Base
    def self.build_controller(namespaced_controller_name)
      names = namespaced_controller_name.split("::")

      controller_name = names.pop

      namespace = build_namespace(names)

      namespace.const_set(controller_name, Class.new(self))
    end

    private

    def self.build_namespace(names)
      names.inject(Object) do |namespace_memo, name|
        if namespace_memo.const_defined?(name)
          namespace_memo.const_get(name)
        else
          namespace_memo.const_set(name, Module.new)
        end
      end
    end

  end
end
