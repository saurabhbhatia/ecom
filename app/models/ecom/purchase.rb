module Ecom
  class Purchase
    include Mongoid::Document
    include Mongoid::Timestamps
    
    field :checked_out_at, type: Time   
    field :total_price, type: Float
    
    has_many :line_items, :dependent => :destroy   

  end
end
