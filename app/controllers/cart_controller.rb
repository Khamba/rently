class CartController < ApplicationController

  before_action :set_order

  def add
    @order.add_to_cart(params[:id], params[:size])
    render json: { status: 200 }
  end

  def remove
    @order.remove_from_cart(params[:id], params[:size])
    render json: { status: 200 }
  end

  def show
    
  end

  private

    def set_order
      @order = @user.orders.where(status: "cart").last || @user.orders.create!
    end

end
