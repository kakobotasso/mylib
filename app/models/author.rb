class Author < ActiveRecord::Base
  has_many :books
  belongs_to :user

  validates :name, presence: true
  validates :user_id, presence: true

  scope :user, -> (user) { where(user_id: user) }
  scope :dashboard, -> { limit(5).order('id DESC') }
end
