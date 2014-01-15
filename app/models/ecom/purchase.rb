module Ecom
  class Purchase
    include Mongoid::Document
    include Mongoid::Timestamps
    
    field :user_id, type: String
    field :checked_out_at, type: DateTime   
    field :total_price,type: DateTime
    
    has_many :line_items, :dependent => :destroy
    belongs_to :user
    
    scope :in_progress, lambda {
     {
      :where => { :checked_out_at.gt.exists => true }     }
    }
    
      scope :complete, lambda {
     {
      :where => { :checked_out_at.gt.exists => false }     }
    }

    COMPLETE = "complete"
    IN_PROGRESS = "in_progress"

    def self.find_with_product(product)
      return [] unless product
      complete.includes(:line_items).
        where(["line_items.product_id = ?", product.id]).
    end

    def checkout!
      self.checked_out_at = Time.now
      self.save
    end

    def recalculate_price!
      self.total_price = line_items.inject(0.0){|sum, line_item| sum += line_item.price }
      save!
    end

    def state
      checked_out_at.nil? ? IN_PROGRESS : COMPLETE
    end

    def display_name
      ActionController::Base.helpers.number_to_currency(total_price) + "- Purchase ##{id} (#{user.email})"
    end
 
    
  end
end
