class NotesController < ApplicationController
  before_action :add_importances,only:[:new,:create,:edit]
  before_action :find_note,only:[:show,:edit,:update,:destroy,:move]
  before_action :authorize_note,only:[:show,:edit,:update,:destroy]
  before_action :find_categories,only:[:new,:create]
  
  def new
    @note = Note.new
  end
  
  def create
    @moves = current_user_category
    @note = Note.new(create_note(note_params[:importance],note_params[:category]))
    if @note.save
      flash[:success] = "The notes #{@note.title} is created!"
      redirect_to note_path(@note)
    else
      render "new"
    end
    
  end
  
  def show
    @moves = current_user_category.reject{|c| c == @note.category}
  end
  
  def edit
    
  end
  
  def update
    importance = Note.importances[note_params[:importance]]
    if @note.update(update_note(importance))
      flash[:success] = "The notes #{@note.title} is updated!"
      redirect_to note_path(@note)
    else
      render "edit"
    end
  end
  
  def destroy
    title = @note.title
    category = @note.category
    if @note.destroy
      flash[:success] = "#{title} is successfully removed!"
      redirect_to category_path(category)
    else
      redirect_back(fallback_location: category_path(category))
    end
  end
  
  def move
    category= Category.find(params[:category].to_i)
    if @note.update(category: category)
      flash[:success] = "Note is moved to category #{category.name}"
      redirect_back(fallback_location: category_path(category))
    else
      flash[:danger] = "Can't move note to category #{category.name}"
      redirect_back(fallback_location: category_path(category))
    end
  end
  
  private
  def note_params
    params.require(:note).permit(:title,:description,:code,:remark,:importance,:category)
  end
  
  def add_importances
       @importances = [{id:0,name:"reference"},{id:1,name:"cheatsheet"}]
  end
  
  def find_note
    @note = Note.find(params[:id])
  end
  
  def create_note(im,ca)
    note_params.merge({importance: im.to_i,category: Category.find(ca.to_i)})
  end
  
  def update_note(im)
    note_params.merge({importance: im.to_i})
  end
  
  def authorize_note
    authorize @note
  end
  
  def current_user_category
    current_user.categories
  end
  
  def find_categories
    @moves = current_user_category
  end
end
