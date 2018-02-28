class Ticket < ApplicationRecord

  belongs_to :alumni, class_name: 'User'
  belongs_to :mentor_profil, class_name: 'User'
  has_one :review

  validates :title, :alumni, :mentor_profil, :ticket_skills, :ticket_location, :ticket_duration, :price,  presence: true

end
