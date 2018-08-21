class User < ApplicationRecord
  validates_presence_of :firstname,:lastname
  has_many :notes
  has_many :categories
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  def full_name
    [firstname,lastname].join(" ")
  end
end
