class StaticPagesController < ApplicationController
  def home
    @pagy, @products = pagy Product.all.newest, items: Settings.pagy.items
  end

  def help; end
end
