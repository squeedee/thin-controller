module ThinController
  class Railtie < Rails::Railtie
    initializer 'thin_controller.extend_application' do |app|
      app.extend(ThinController::ApplicationExtension)
    end
  end
end

