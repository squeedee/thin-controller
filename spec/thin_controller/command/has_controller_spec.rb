require 'spec_helper'

module ThinController
  module Command
    describe HasController do

      describe 'when mixed in' do
        let(:command_example_class) do
          klass = Class.new
          klass.instance_eval do
            include HasController
          end
          klass
        end

        let(:calling_controller) { double(:calling_controller) }

        subject(:command_example) { command_example_class.new }

        it 'has an accessor for the calling controller' do
          command_example.controller = calling_controller

          expect(command_example.controller).to eql calling_controller
        end

      end

    end
  end
end
