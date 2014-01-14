module Ecom
  class LineItem
    include Mongoid::Document
    include Mongoid::Timestamps
    
    field :order_id, type: String
    field :product_id, type: String
    field :price, type: String    

    belongs_to :order
    belongs_to :product
  end
end
