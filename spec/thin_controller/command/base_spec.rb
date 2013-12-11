require 'spec_helper'

module ThinController
  module Command
    describe Base do

      it 'includes HasController' do
        expect(Base.included_modules).to include(HasController)
      end

    end
  end
end
