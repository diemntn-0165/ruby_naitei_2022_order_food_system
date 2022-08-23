class OrdersController < ApplicationController
  def new
    @order = Order.new
  end
  def create
    @order = Order.new(
      user_id: params[:order][:user_id],
      user_name: params[:order][:user_name],
      phone_number: params[:order][:phone_number],
      address: params[:order][:address],
      note: params[:order][:note],
      payment_type: params[:order][:payment_type],
      total: total_price_from_cart
    )

    if @order.save
      session[:cart]['products'].each do |product_id, product|
        DetailOrder.create(
          order_id: @order.id,
          product_id: product_id.to_i,
          quantity: product['count'],
          price: product['price'],
        )
      end
      session.delete(:cart)
      redirect_to "#{root_path}#message= Order successed."
    else
      @products = products_from_cart
      @tottal_price = total_price_from_cart
      render :new
    end
  end

  private

  def products_from_cart
    products = []
    session[:cart]['products'].each do |id, value|
      product = Product.find(id.to_i)
      products << { product: product, count: value['count'] }
    end
    return products
  end

  def total_price_from_cart
    session[:cart]['tottal_price']
  end
end
