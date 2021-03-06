class DashboardController < ApplicationController
  skip_before_action :authenticate_user!,only:[:notesvine]
  
  def user
    @categories = current_user.categories
    @notes = Note.where(category: @categories).order_paginate(params[:page],10)
  end
  
  def search
    @search = params[:search]
    @notes = Note.search(@search).order(:category_id).order_paginate(params[:page],10)
  end
  
  def notesvine
  end
end
