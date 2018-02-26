class Ticket < ApplicationRecord
  belongs_to :mentor, class_name: 'User', foreign_key: :mentor_id
  belongs_to :alumni, class_name: 'User', foreign_key: :alumni_id

  validates :title, :alumni_id, :mentor_id, :ticket_skills, :ticket_location, :ticket_duration, :price,  presence: true

end
