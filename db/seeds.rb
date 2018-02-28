require 'open-uri'
require 'nokogiri'
require 'json'

puts 'Cleaning database...'
MentorProfil.destroy_all
User.destroy_all
Review.destroy_all
Ticket.destroy_all
Tag.destroy_all
Skill.destroy_all


COOKIES = "_kitt2017_=Z04yK20wWDFFdXFyN2VwUFVHK0RNMTh1cG5MMVUrQnN6TDZuZTJHY3pHQjVEWnhpdVFmb1JlVDVycjBHSk9wdWJHaWt1VnE3cllmdUZKZzFubWpYV0haRzIxemNYanVDMXovZjVkZDdsL1oxTlRScUJoM3puQ2FLVDZBWmtkVitEeFR0MUZ2cEtOVVFjVWs1cDJWWk9FNzBQcFZhR3RPdDhJY1pVdlNFalU0Z09kY1ZrYkoyL3V0OEFuWVBib1lTYnNuR3d3RmcvVFFGd3pYMHk3WWlFbnN5cTRNOU9vTWNsaEcrc29Ia1FwcTZmZ0ZLNTE0NFhKQ2QrbnBVQ0Q5ZHFQb1ppZEpTb052Sjgrak1qMDZEdVFFTnRDenh2ZU1zVUpGRWRFNzhuVUhDZGlJSFI5QWNkSVNKS2JnUG5rTitTeExCWXlvZXdaMG0zVDh2Y0ttSEdRUUZWZGFTSk1hRzRmSWlVd2xVSXdsQS9BQmE0Y3ptZ0ErOVhaRlBqQSs4LS0xbkpMMUpoVW5KeElVc0cyWUtDWDJnPT0%3D--321cb1189533c5490dc086095b595fd2e253338f"
url = "https://kitt.lewagon.com/camps/121/classmates"

html_file = open(url, "Cookie" => COOKIES).read

students = []
html_doc = Nokogiri::HTML(html_file)
html_doc.css('.img-thumbnail').each do |element|
 students << element.parent.first[1][(8..-1)]
end

users = []
students.each do |element|
  url = "https://kitt.lewagon.com/api/v1/users/#{element}"
  student_url = open(url, "Cookie" => COOKIES).read
  student = JSON.parse(student_url)
   users << User.create!(
    email: student["email"],
    password: "azerty",
    first_name: student["first_name"],
    last_name: student["last_name"],
    phone_number: student["phone"],
    batch_wagon: "121"
  )
end


 puts 'Creating Mentor Profils Seeds...'

  p josephmentor = MentorProfil.create!(
      experience: "J'ai appelé némo en vain, alors je suis devenu développeur fullstack",
      minimum_price: "50",
      user_id: users.sample.id
)

 kevinmentor = MentorProfil.create!(
      experience: "Paraît-il que je ne suis pas très à l'écoute de mes étudiantes concernant l'apprentissage du twerk",
      minimum_price: "100",
      user_id: users.sample.id
)

puts 'Creating Tickets Seeds...'
  ticket1 = Ticket.create!(
      title: "Besoin d'aide pour installer ruby",
      alumni: users.first,
      mentor: josephmentor.user,
      ticket_skills: "Ruby",
      ticket_location: "Dakar",
      ticket_duration: "3 semaines",
      price: "300€",
    )
# ticket2 = Ticket.create!(
#       title: "Pundit apparaît Alors que je penser ne pas l'avoir installer",
#       alumni_id: lah.id,
#       mentor_id: matmentor.id,
#       ticket_skills: "Rails",
#       ticket_location: "Lyon",
#       ticket_duration: "1 semaines",
#       price: "150€",
#     )

# ticket3 = Ticket.create!(
#       title: "pbm avec n git push",
#       alumni_id: mat.id,
#       mentor_id: isamentor.id,
#       ticket_skills: "Git",
#       ticket_location: "Paris",
#       ticket_duration: "3 mois",
#       price: "1300€",
#     )

# ticket4 = Ticket.create!(
#       title: "need help with git xxxxxxxxx",
#       alumni_id: moh.id,
#       mentor_id: isamentor.id,
#       ticket_skills: "Git",
#       ticket_location: "Marseille",
#       ticket_duration: "1 jours",
#       price: "30€",
#     )
puts 'Creating Skills Seeds...'
skill1 = Skill.create!(
      name: "Ruby",
  )
skill2 = Skill.create!(
      name: "HTML",
  )
skill3 = Skill.create!(
      name: "CSS",
  )
skill4 = Skill.create!(
      name: "Python",
  )
skill5 = Skill.create!(
      name: "Javascript",
  )

 puts 'Finished!'
