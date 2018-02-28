class Ticket < ApplicationRecord
  belongs_to :alumni, class_name: 'User'
  belongs_to :mentor, class_name: 'User'

  validates :title, :alumni, :mentor, :ticket_skills, :ticket_location, :ticket_duration, :price,  presence: true

end
