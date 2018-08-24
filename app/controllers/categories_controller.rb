class CategoriesController < ApplicationController
  before_action :find_category,only:[:edit,:show,:update]
  
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
      render "new"
    end
  end
  
  def edit
    
  end
  
  def update
    if @category.update(category_params)
      flash[:success] = "Update successful!"
      redirect_to category_path(@category)
    else
      render "edit"
    end
  end
  
  private
  def category_params
    params.require(:category).permit(:name)
  end
  
  def find_category
    @category = Category.find(params[:id])
  end
end
