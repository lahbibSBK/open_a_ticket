class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :alumni_tickets, class_name: 'Ticket', foreign_key: :alumni_id
  has_many :mentor_tickets, class_name: 'Ticket', foreign_key: :mentor_id

end
