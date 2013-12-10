require 'spec_helper'

module ThinController
  describe Base do
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
        end

        specify 'is a subclass of Base' do
          expect(new_controller).to be_a_kind_of(Base)
        end
      end
    end
  end
end
