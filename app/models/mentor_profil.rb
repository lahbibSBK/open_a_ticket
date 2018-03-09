class MentorProfil < ApplicationRecord
  belongs_to :user
  has_many :mentor_tickets, through: :user
  has_many :reviews, through: :mentor_tickets

  delegate :pic_url, :first_name, :last_name, to: :user

  before_validation :set_mentor_profil

  Gutentag::ActiveRecord.call self

  def full_name
    "#{first_name.capitalize} #{last_name.upcase}"
  end

  def note
    reviews.sum(:rating) / reviews.count
  end

  private

  def set_mentor_profil
    return if commit_number
    self.commit_number = (13..1023).to_a.sample
  end
end
