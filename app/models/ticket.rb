class Ticket < ApplicationRecord
  belongs_to :alumni_id, class_name: 'User'
  belongs_to :mentor_id, class_name: 'User'

  validates :title, :alumni_id, :mentor_id, :ticket_skills, :ticket_location, :ticket_duration, :price,  presence: true

end
