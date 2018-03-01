class Skill < ApplicationRecord
  has_many :tags

  validates :name, uniqueness: true, presence: true
end
