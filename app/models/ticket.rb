class Ticket < ApplicationRecord
  PRIORITIES = ["high", "medium", "low"]

  belongs_to :mentor, class_name: 'User', foreign_key: :mentor_id, optional: true
  belongs_to :alumni, class_name: 'User', foreign_key: :alumni_id

  has_one :review, dependent: :destroy
  has_one :mentor_profil, through: :mentor
  has_one :order, dependent: :destroy

  validates :title, :alumni_id, :tag_names, :ticket_duration, :price_cents,  presence: true

  Gutentag::ActiveRecord.call(self)

  monetize :price_cents

  def needs?(skill)
    tag_names.include?(skill)
  end

  def match_mentors
    MentorProfil.tagged_with(
      names: tag_names,
      match: :any
    ).where('minimum_price <= ?', price_cents / 100).order(minimum_price: :asc)
  end
end
