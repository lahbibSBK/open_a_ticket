class MentorProfil < ApplicationRecord
  has_many :tags
  has_many :skills, through: :tags
  belongs_to :user
  has_many :reviews, through: :tickets

end
