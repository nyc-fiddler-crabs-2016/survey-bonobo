class User < ActiveRecord::Base
  has_secure_password

  has_many :surveys
  has_many :authored_surveys, class_name: 'User', foreign_key: :author_id

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true
  validates :password, presence: true
end
