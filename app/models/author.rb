class Author < ActiveRecord::Base
  has_many :books
  belongs_to :user

  validates :name, presence: true
  validates :user_id, presence: true
  validates :slug, uniqueness: { scope: :user_id, message: I18n.t('activerecord.errors.author.slug.duplicated') }

  scope :user, -> (user) { where(user_id: user) }
  scope :dashboard, -> { limit(5).order('id DESC') }
end
