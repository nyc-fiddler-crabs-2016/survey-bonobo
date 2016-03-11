class Choice < ActiveRecord::Base
  validates :content, presence: true
  validates :selected, presence: true

  belongs_to :question
  belongs_to :reader, class_name: "User"
end
