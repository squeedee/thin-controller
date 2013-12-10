require 'spec_helper'

module ThinController
  describe ControllerDefinitions do
    describe 'resources are mapped' do
      let(:controller_seed) { rand(10000) }

      subject(:controller_definitions) { ThinController::ControllerDefinitions.new() }

      before do
        allow(Base).to receive(:build_controller)
      end

      specify 'root controller' do
        controller_definitions.paint do |painter|
          painter.resources ("my_thing_#{controller_seed}").to_sym
        end

        expect(Base).to have_received(:build_controller).
          with("MyThing#{controller_seed}Controller")
      end

      specify 'namespaced controllers' do
        controller_definitions.paint do |painter|
          painter.namespace ("my_namespace_#{controller_seed}").to_sym do |namespace_painter|
            namespace_painter.resources ("my_thing_#{controller_seed}").to_sym
          end
        end

        expect(Base).to have_received(:build_controller).
          with("MyNamespace#{controller_seed}::MyThing#{controller_seed}Controller")
      end

      specify 'nested controllers' do
        controller_definitions.paint do |painter|
          painter.resources ("my_root_#{controller_seed}").to_sym do |namespace_painter|
            namespace_painter.resources ("my_sub_#{controller_seed}").to_sym
          end
        end

        expect(Base).to have_received(:build_controller).
          with("MyRoot#{controller_seed}Controller")

        expect(Base).to have_received(:build_controller).
          with("MyRoot#{controller_seed}::MySub#{controller_seed}Controller")
      end

    end
  end
end
