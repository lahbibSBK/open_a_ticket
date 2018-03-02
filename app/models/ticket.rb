class Ticket < ApplicationRecord

  PRIORITIES = ["high", "medium", "low"]
  SKILLS = ["HTML", "CSS", "RUBY ON RAILS", "RUBY", "PHP", "IOS", "ANGULAR JS", "PYTHON", "ANDROID", "MYSQL", "WORDPRESS", "XCODE", "JAVA", "C", "NODE JS", "ASP.NET", "BOOTSTRAP", "SHOPIFY", "GITHUB", "GO", "HEROKU", "REACT", "MONGO DB", "MAGENTO", "POSTGRESQL", "SEO", "UX/UI" ]


  belongs_to :mentor, class_name: 'User', foreign_key: :mentor_id, optional: true
  belongs_to :alumni, class_name: 'User', foreign_key: :alumni_id
  has_one :review
  has_one :mentor_profil, through: :mentor

  validates :title, :alumni_id, :ticket_skills, :ticket_location, :ticket_duration, :price,  presence: true

  Gutentag::ActiveRecord.call self

end
