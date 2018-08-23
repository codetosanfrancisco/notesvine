class NotesController < ApplicationController
  before_action :add_importances,only:[:new,:create]
  
  def new
    @note = Note.new
  end
  
  def create
    @note = Note.new(note_params.merge({importance: note_params[:importance].to_i}))
    @note.category = current_category
    if @note.save
      flash[:success] = "The notes #{@note.title} is created!"
      redirect_to note_path(@note)
    else
      render "new"
    end
    
  end
  
  def show
    @note = Note.find(params[:id])
  end
  
  
  private
  def note_params
    params.require(:note).permit(:title,:description,:code,:remark,:importance)
  end
  
  def add_importances
       @category_name = current_category.name
       @importances = [{id:0,name:"Reference"},{id:1,name:"Cheatsheet"}]
    end
end
