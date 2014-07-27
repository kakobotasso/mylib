class Book < ActiveRecord::Base
  belongs_to :author
  belongs_to :user

  validates :name, presence: true
  validates :author_id, presence: true
  validates :wishlist, inclusion: [true, false]
  validates :link, presence: true 
  validates :read, inclusion: [true, false]
  validates :user_id, presence: true
end
