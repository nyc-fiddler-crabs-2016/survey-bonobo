class Survey < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :author, class_name: "User"
  has_many :questions
  has_many :survey_readers
  has_many :readers, through: :survey_readers, source: :user
  # Remember to create a migration!
end
