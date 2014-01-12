Rails.application.routes.draw do

  mount Ecom::Engine => "/ecom", :as => 'store'
end
