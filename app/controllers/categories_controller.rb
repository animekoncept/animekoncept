class CategoriesController < ApplicationController
  def index
    @categories = Category.all.order("created_at DESC")
  end
  def show
    @category = Category.find params[:id]
    @topics = @category.topics
  end
end
