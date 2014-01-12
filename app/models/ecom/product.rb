module Ecom
  class Product
    include Mongoid::Document
    field :name, type: String
    field :description, type: String
    field :base_price, type: Float
    field :sku, type: String
  
    belongs_to :category
    mount_uploader :image, ImageUploader
  end
end
