class Admin::DashboardController < ApplicationController
  def show
    @products = Product.all.size
    @categories = Category.all.size
  end
end
