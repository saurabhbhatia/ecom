require_dependency "ecom/application_controller"

module Ecom
  class CartController < ApplicationController
    before_filter :authenticate_user!
    before_filter :get_cart_value
    
  def add
    @cart.save if @cart.new_record?
    session[:cart_id] = @cart.id
    product = Product.find(params[:id])
    LineItem.create! :purcahse => @cart, :product => product, :price => product.price
    @cart.recalculate_price!
    flash[:notice] = "Product Added to Cart"
    redirect_to '/cart'
  end

  def remove
    item = @cart.line_items.find(params[:id])
    item.destroy
    @cart.recalculate_price!
    flash[:notice] = "Product Deleted from Cart"
    redirect_to cart_path
  end

  def checkout
    @cart.checkout!
    session.delete(:cart_id)
    flash[:notice] = "Thank your for the Order! We will e-mail you with the shipping info."
    redirect_to root_path
  end

  protected

  def get_cart_value
    @cart = session[:cart_id] ? Purchase.find(session[:cart_id]) : current_user.purchases.create(params[:order])
  end

  end
end
