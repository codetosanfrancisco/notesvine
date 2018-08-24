class Note < ApplicationRecord
  belongs_to :category
  validates_presence_of :description,:title
  enum importance: { reference:0, cheatsheet: 1}
  
  def self.search(search)
    where("title LIKE ? or description LIKE ?","%#{search}%","%#{search}%")
  end
  
  def self.order_paginate(page,num)
    order("created_at DESC").paginate(:page => page, :per_page => num)
  end
end
