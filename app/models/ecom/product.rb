module Ecom
  class Product
    include Mongoid::Document
    include Mongoid::Slug

    field :name, type: String
    field :description, type: String
    field :base_price, type: Float
    field :sku, type: String

    slug :name, history: true 
    belongs_to :category
    mount_uploader :image, ImageUploader
    
    def recalculate_price!
     self.total_price = line_items.inject(0.0){|sum, line_item| sum += line_item.price }
     save!
   end
  end
end
