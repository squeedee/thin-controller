require 'spec_helper'

module ThinController
  describe Base do

    describe 'adding_methods' do
      let(:action_command) { double(:action_command) }

      subject(:controller) { Base.build_controller('SomeController') }

      before do
        stub_const('SomeController::AnAction', Class.new())

        allow(SomeController::AnAction).
          to receive(:new).
          with(controller).
          and_return(action_command)

        allow(action_command).
          to receive(:execute)
      end

      specify do
        controller.an_action

        expect(action_command).
          to have_received(:execute)
      end
    end

    describe '.build_controller' do
      specify 'as a root constant' do
        expect { SomeController }.to raise_exception()

        Base.build_controller('SomeController')

        expect { SomeController }.not_to raise_exception()
      end

      specify 'as a nested constant' do
        expect { Hey::There::SomeController }.to raise_exception()

        Base.build_controller('Hey::There::SomeController')

        expect { Hey::There::SomeController }.not_to raise_exception()
      end

      describe 'the result' do

        subject(:new_controller) { Base.build_controller('Hey::There::SomeOtherController') }

        specify 'is the new controller class' do
          expect(new_controller).to equal Hey::There::SomeOtherController
          expect(new_controller.superclass).to eql(Base)
        end
      end
    end
  end
end
