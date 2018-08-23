class DashboardController < ApplicationController
  helper_method :category_notes
  
  def user
    @categories = current_user.categories
  end
  
  protected 
  def category_notes(category)
    category.notes.order('created_at DESC').limit(9)
  end
end
