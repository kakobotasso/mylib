class Book < ActiveRecord::Base
  belongs_to :author
  belongs_to :user

  validates :name, presence: true
  validates :author_id, presence: true
  validates :wishlist, inclusion: [true, false]
  validates :link, presence: true 
  validates :read, inclusion: [true, false]
  validates :user_id, presence: true

  scope :user, -> (user) { where(user_id: user) }
  scope :read, -> { where(read: true) }
  scope :bought, -> { where(wishlist: false) }
  scope :wishlist, ->  { where(wishlist: true) }
  scope :dashboard, -> { limit(5).order('id DESC') }
end
