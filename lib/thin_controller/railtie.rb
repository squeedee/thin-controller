module ThinController
  class Railtie < Rails::Railtie
    initializer 'thin_controller.configure',
    after: 'action_dispatch.configure' do |app|
      app
      # app.middleware.use MyRailtie::Middleware
    end
  end
end

