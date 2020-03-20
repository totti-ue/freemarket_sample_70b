class CategoriesController < ApplicationController

  def index
  end

  def get_children
    @children = Category.find(params[:parent_id]).children
  end

  def get_grandchildren
    @grandchildren = Category.find(params[:child_id]).children
  end
  
end
