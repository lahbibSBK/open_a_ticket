class MentorProfil < ApplicationRecord
  belongs_to :user
  has_many :reviews, through: :tickets

  Gutentag::ActiveRecord.call self
end
