Dummy::Application.routes.draw do
  resources :thin_posts
  resources :posts
end

Dummy::Application.thin_controllers.paint do
  resources :thin_posts
end
