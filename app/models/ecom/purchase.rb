module Ecom
  class Purchase
    include Mongoid::Document
    include Mongoid::MultiParameterAttributes
    include Mongoid::Timestamps
    
    field :user_id, type: String
    field :checked_out_at, type: DateTime   
    field :total_price, type: Float
    
    has_many :line_items, :dependent => :destroy
    belongs_to :user
   

  end
end
