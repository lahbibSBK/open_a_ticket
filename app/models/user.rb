class User < ApplicationRecord
  devise :omniauthable, omniauth_providers: [:github]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :alumni_tickets, class_name: 'Ticket', foreign_key: :alumni_id
  has_many :mentor_tickets, class_name: 'Ticket', foreign_key: :mentor_id
  has_one :mentor_profil

  has_many :reviews, through: :mentor_tickets

  validates :email, uniqueness: true, presence: true
  validates_uniqueness_of :first_name, scope: :last_name, presence: true

  def self.find_for_github_oauth(auth)
    login = auth.extra.raw_info.login
    email = "#{login.downcase}.github@open.fr"
    @avatar = auth.extra.raw_info.avatar_url

    user = User.find_by(email: email)
    if user
      user.update(email: email)
    else
      user = User.new(email: email)
      user.password = Devise.friendly_token[0,20]
      user.pic_url = @avatar
      user.save
    end

    return user
  end
end
