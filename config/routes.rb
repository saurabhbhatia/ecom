Ecom::Engine.routes.draw do
  resources :categories

  devise_for :users, {
    :class_name => "Ecom::User",
    module: :devise
  }
  resources :products
  root to: "products#index"
end
