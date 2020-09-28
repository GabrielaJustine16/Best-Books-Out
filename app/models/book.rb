class Book < ApplicationRecord
  belongs_to :author
  belongs_to :user #creator of it
  has_many :reviews
  has_many :users, through: :reviews #ppl who have reviewed it


  def author
  end 

  def author=
  end 

  def author_id




















end
