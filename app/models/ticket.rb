class Ticket < ApplicationRecord
  belongs_to :mentor_profil
  belongs_to :alumni, class_name: 'User', foreign_key: :alumni_id
  has_one :review

  validates :title, :alumni_id, :mentor_profil_id, :ticket_skills, :ticket_location, :ticket_duration, :price,  presence: true

end
