require 'spec_helper'

module ThinController
  describe ApplicationExtension do
    describe 'controller definitions are attached to the app' do
      subject(:app) { Class.new.extend(ThinController::ApplicationExtension) }

      let(:controller_definitions) { double(:controller_definitions) }

      before do
        allow(ControllerDefinitions).to receive(:new).
        and_return(controller_definitions)
      end

      specify do
        expect(app.thin_controllers).to eql controller_definitions
      end
    end
  end
end
