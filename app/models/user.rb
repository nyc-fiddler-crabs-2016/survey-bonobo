class User < ActiveRecord::Base
  has_secure_password

  has_many :authored_surveys, class_name: 'Survey', foreign_key: :author_id
  has_many :survey_readers
  has_many :read_surveys, through: :survey_readers, source: :survey
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true
  validates :password, presence: true
end
