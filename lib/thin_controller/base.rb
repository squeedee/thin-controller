module ThinController
  module Base
    def method_for_action(action_name)
      if command_exists?(action_name)

        class_eval "
                   def #{action_name}
                      puts 'omfg'
                     head :ok
                   end
                 "
        action_name
      else
        super
      end
    end

    private
    def command_exists?(action)
      true
    end

  end
end
