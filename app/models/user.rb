class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :alumni_tickets, class_name: 'Ticket', foreign_key: :alumni_id
  has_one :mentor_profil
  validates :last_name, :first_name, :email, uniqueness: true
  validates :batch_wagon, :phone_number, presence: true

end
