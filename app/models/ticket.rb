class Ticket < ApplicationRecord
  PRIORITIES = ["high", "medium", "low"]

  belongs_to :mentor, class_name: 'User', foreign_key: :mentor_id, optional: true
  belongs_to :alumni, class_name: 'User', foreign_key: :alumni_id

  has_one :review
  has_one :mentor_profil, through: :mentor
  has_one :order

  validates :title, :alumni_id, :tag_names, :ticket_location, :ticket_duration, :price_cents,  presence: true

  Gutentag::ActiveRecord.call(self)

  monetize :price_cents
end
