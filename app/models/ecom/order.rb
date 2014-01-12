module Ecom
  class Order
    include Mongoid::Document
    include Mongoid::Timestamps
    field :user_id, type: String
    field :checked_out_at, type: DateTime   
    field :total_price
    
    has_many :line_items
    belongs_to :user
    
    
  end
end
