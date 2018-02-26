class Skill < ApplicationRecord
  has_many :tags

  validates :name, uniqueness: true, presence: true, inclusion: {in: ["Ruby", "HTML", "CSS", "Python", "Javascript"]}
end
