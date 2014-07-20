class Author < ActiveRecord::Base
  has_many :books
  belongs_to :user

  validates :name, presence: true
  validates :user_id, presence: true
end
