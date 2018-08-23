class NotesController < ApplicationController
  before_action :add_importances,only:[:new,:create,:edit]
  before_action :find_note,only:[:show,:edit,:update]
  
  def new
    @note = Note.new
  end
  
  def create
    @note = Note.new(create_note(note_params[:importance].to_i))
    @note.category = current_category
    if @note.save
      flash[:success] = "The notes #{@note.title} is created!"
      redirect_to note_path(@note)
    else
      render "new"
    end
    
  end
  
  def show
    
  end
  
  def edit
    
  end
  
  def update
    importance = Note.importances[note_params[:importance]]
    if @note.update(create_note(importance))
      flash[:success] = "The notes #{@note.title} is updated!"
      redirect_to note_path(@note)
    else
      render "edit"
    end
    
  end
  private
  def note_params
    params.require(:note).permit(:title,:description,:code,:remark,:importance)
  end
  
  def add_importances
       @category_name = current_category.name
       @importances = [{id:0,name:"reference"},{id:1,name:"cheatsheet"}]
  end
  
  def find_note
    @note = Note.find(params[:id])
  end
  
  def create_note(value)
    note_params.merge({importance: value})
  end
end
