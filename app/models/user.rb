class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :alumni_tickets, class_name: 'Ticket', foreign_key: :alumni_id
  has_many :mentor_tickets, class_name: 'Ticket', foreign_key: :mentor_id
  has_one :mentor_profil

  has_many :reviews, through: :mentor_tickets

  validates :last_name, :first_name, :email, uniqueness: true
end
