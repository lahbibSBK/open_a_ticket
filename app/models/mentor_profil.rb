class MentorProfil < ApplicationRecord
  belongs_to :user
  has_many :mentor_tickets, through: :user
  has_many :reviews, through: :mentor_tickets

  delegate :pic_url, :first_name, :last_name, to: :user

  Gutentag::ActiveRecord.call self

  def full_name
    "#{first_name.capitalize} #{last_name.upcase}"
  end
end
