require 'thin_controller/controller_definitions'

module ThinController
  module ApplicationExtension
    def thin_controllers
      @controller_definitions ||= ControllerDefinitions.new
    end
  end
end
