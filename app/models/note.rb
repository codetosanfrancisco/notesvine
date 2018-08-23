class Note < ApplicationRecord
  belongs_to :category
  validates_presence_of :description,:title
  enum importance: { reference:0, cheatsheet: 1}
end
