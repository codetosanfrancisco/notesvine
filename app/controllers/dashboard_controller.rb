class DashboardController < ApplicationController
  helper_method :category_notes
  
  def user
    @categories = current_user.categories
  end
  
  protected 
  def category_notes(category)
    category.notes
  end
end
