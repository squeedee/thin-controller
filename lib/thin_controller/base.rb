module ThinController
  module Base
    def method_for_action(action_name)
      command = find_command(action_name)
      return super unless command

      build_command_proxy(action_name, command)
      action_name
    end

    private

    def build_command_proxy(action_name, command_constant)
      class_eval <<-CLASS
          def #{action_name}
            command = #{command_constant}.new(params,request)
          end
      CLASS
    end

    def find_command(action_name)

    end

  end
end
