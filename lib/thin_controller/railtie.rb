module ThinController
  class Railtie < Rails::Railtie
    config.app_generators.orm :my_railtie_orm

    # Add a to_prepare block which is executed once in production
    # and before each request in development
    config.to_prepare do
      MyRailtie.setup!
    end
  end
end

