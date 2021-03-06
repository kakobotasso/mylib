class User < ActiveRecord::Base
  has_many :authors
  has_many :books

  validates :name, presence: true
  validates :email, presence: true
  validates :login, presence: true
  validates :password, presence: true

  def password=(password)
    value = Digest::SHA1.hexdigest(password)
    write_attribute(:password, value)
  end
end
