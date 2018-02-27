class MentorProfil < ApplicationRecord
  has_many :tags
  has_many :skills, through: :tags
  has_one :user
end
