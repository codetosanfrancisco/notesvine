class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @notes = @category.notes.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    session[:category_id] = @category.id
  end
  
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user = current_user
    if @category.save
      flash[:success] = "Category #{@category.name} is created!"
      redirect_to root_path
    else
      flash.now[:danger] = "Try again!"
      render "new"
    end
  end
  
  private
  def category_params
    params.require(:category).permit(:name)
  end
end
