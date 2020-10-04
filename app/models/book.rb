class Book < ApplicationRecord
  belongs_to :author
  belongs_to :user #creator of it
  has_many :reviews
  has_many :users, through: :reviews #ppl who have reviewed it
  #accepts_nested_attributes_for :author
  validates :title, presence: true
  validate :not_a_duplicate

  scope :order_by_rating, -> {left_joins(:reviews).group(:id).order('avg(stars) desc')}

  #def author
  #end 

  #def author=
  #end 

  #def author_id

  def self.alpha
    order(:title)
  end


  def author_attributes=(attributes)
    self.author = Author.find_or_create_by(attributes) if !attributes['name'].empty?
    self.author
  end

  

  def not_a_duplicate
    # if there is already an ice cream with that flavor && brand, throw an error
    book = Book.find_by(title: title, author_id: author_id)
    if !!book && book != self
      errors.add(:title, 'has already been added for that author')
    end
  end

  def author_name
    author.try(:name)
  end

  def title_and_author
    "#{title} - #{author.try(:name)}"
  end


end




















end
