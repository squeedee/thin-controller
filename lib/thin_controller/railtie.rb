module ThinController
  class Railtie < Rails::Railtie
    initializer 'thin_controller.configure',
    after: 'action_dispatch.configure' do |app|
    end
  end
end

