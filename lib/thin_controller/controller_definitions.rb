require 'thin_controller/base'
require 'active_support/inflector'

module ThinController
  class ControllerDefinitions
    def initialize(parent_namespace = nil)
      @parent_namespace = parent_namespace
    end

    def paint(&block)
      block.arity == 1 ?
        yield(self) : self.instance_eval(&block)
    end

    def resources(name, &block)
      controller_name = fully_qualified_controller(name).to_s.camelize
      Base.build_controller(controller_name)

      namespace(name, &block) if block_given?
    end

    def namespace(parent_namespace, &block)
      ControllerDefinitions.
        new(parent_namespace).
        paint(&block)
    end

    private

    attr_reader :parent_namespace

    def fully_qualified_controller(name)
      fully_qualified_name("#{name}_controller")
    end

    def fully_qualified_name(name)
      if parent_namespace.present?
        "#{parent_namespace}/#{name}"
      else
        name
      end
    end

  end
end
