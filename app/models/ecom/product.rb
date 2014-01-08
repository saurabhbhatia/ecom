module Ecom
  class Product
    include Mongoid::Document
    field :name, type: String
    field :description, type: String
    field :base_price, type: Float
  end
end
