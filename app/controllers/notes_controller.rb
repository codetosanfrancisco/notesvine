class NotesController < ApplicationController
  def new
    @category_name = current_category.name
    @note = Note.new
  end
end
