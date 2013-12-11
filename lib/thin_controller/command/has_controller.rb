module ThinController
  module Command
    module HasController
      extend ActiveSupport::Concern

      included do
        attr_accessor :controller
      end
    end
  end
end