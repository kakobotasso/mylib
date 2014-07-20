class Book < ActiveRecord::Base
  belongs_to :author

  validates :name, presence: true
  validates :author_id, presence: true
  validates :grade, presence: true
  validates :wishlist, inclusion: [true, false]
  validates :link, presence: true 
  validates :read, inclusion: [true, false]
end
