require 'open-uri'
require 'nokogiri'
require 'json'


puts 'Cleaning database...'

Review.destroy_all
Ticket.destroy_all
Tag.destroy_all
Skill.destroy_all
MentorProfil.destroy_all
User.destroy_all

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
    batch_wagon: "121",
    pic_url: student["avatar"]
  )
end


 puts 'Creating Mentor Profils Seeds...'
jos = User.create!(
      email: "jos@gmail.com",
      password: "azerty",
      first_name: "joseph",
      last_name: "Blachard",
      phone_number: "0612345677",
      address: "12 rue de saint fons 69007 LYON",
      batch_wagon: "XXX",
      pic_url: "https://avatars3.githubusercontent.com/u/5313828?v=4"
)
josephmentor = MentorProfil.create!(
      experience: "J'ai appelé némo en vain, alors je suis devenu développeur fullstack",
      minimum_price: "50",
      user_id: jos.id
)
kev = User.create!(
      email: "kev@gmail.com",
      password: "azerty",
      first_name: "kévin",
      last_name: "Chavanne",
      phone_number: "0612345676",
      address: "12 rue de saint fons 42001  saint-étienne",
      batch_wagon: "XYX",
      pic_url: "https://avatars1.githubusercontent.com/u/472453?v=4"
)
 kevinmentor = MentorProfil.create!(
      experience: "Paraît-il que je ne suis pas très à l'écoute de mes étudiantes concernant l'apprentissage du twerk",
      minimum_price: "100",
      user_id: kev.id
)


puts 'Creating Tickets Seeds...'
  ticket10 = Ticket.create!(
      title: "Besoin d'aide pour installer ruby",
      alumni: users.first,
      mentor_profil: josephmentor,
      ticket_skills: "Ruby",
      ticket_location: "Dakar",
      ticket_duration: "3 semaines",
      price: "300€",
      priority: "low",
      status: "active",
    )



#seeds pour le débug à supprimer à la fin
puts 'Creating Users Seeds...'
isa = User.create!(
      email: "iza@gmail.com",
      password: "azerty",
      first_name: "isabelle2",
      last_name: "Pontoizeau2",
      phone_number: "0612345678",
      address: "12 rue de Marseille 69007 LYON",
      batch_wagon: "121",
      pic_url: "https://avatars2.githubusercontent.com/u/34674849?v=4"
)
lah = User.create!(
      email: "lah@gmail.com",
      password: "azerty",
      first_name: "lahbib2",
      last_name: "belhaddad2",
      phone_number: "0612345679",
      address: "12 rue de la planète Mars 69007 LYON",
      batch_wagon: "111",
      pic_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/evqefyvpwl5csouogibi.jpg"
)
moh = User.create!(
      email: "moh@gmail.com",
      password: "azerty",
      first_name: "mohamed2",
      last_name: "Diop2",
      phone_number: "0612345680",
      address: "123 avenue Jean Jaures 69007 LYON",
      batch_wagon: "404",
      pic_url: "https://avatars2.githubusercontent.com/u/30232344?v=4"
)

mat = User.create!(
      email: "mat@gmail.com",
      password: "azerty",
      first_name: "Mathieu2",
      last_name: "Nicolas2",
      phone_number: "0612345681",
      address: "23 rue de Montrochet 69002 LYON",
      batch_wagon: "89",
      pic_url: "https://avatars3.githubusercontent.com/u/31872246?v=4"
)

puts 'Creating Mentor Profils Seeds...'
isamentor = MentorProfil.create!(
      experience: "Je sais répéter toutes les instructions git en rotant",
      minimum_price: "50",
      user_id: isa.id
)
matmentor = MentorProfil.create!(
      experience: "Tinder a tout copié sur mon site perso",
      minimum_price: "100",
      user_id: mat.id
)

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

puts 'Creating Tags Seeds...'
tagisa = Tag.create!(
      mentor_profil_id: isamentor.id,
      skill_id: skill1.id
  )
Tag.create!(
      mentor_profil_id: isamentor.id,
      skill_id: skill2.id
  )
Tag.create!(
      mentor_profil_id: isamentor.id,
      skill_id: skill3.id
  )
Tag.create!(
      mentor_profil_id: isamentor.id,
      skill_id: skill4.id
  )
Tag.create!(
      mentor_profil_id: isamentor.id,
      skill_id: skill5.id
  )
tagmat = Tag.create!(
      mentor_profil_id: matmentor.id,
      skill_id: skill2.id
  )

puts 'Creating Tickets Seeds...'
ticket1 = Ticket.create!(
      title: "Besoin d'aide pour installer ruby",
      alumni_id: moh.id,
      mentor_profil: isamentor,
      ticket_skills: "Ruby",
      ticket_location: "Dakar",
      ticket_duration: "3 semaines",
      price: "300€",
      priority: "low",
      status: "closed",
    )
ticket2 = Ticket.create!(
      title: "Pundit apparaît Alors que je penser ne pas l'avoir installer",
      alumni_id: lah.id,
      mentor_profil: matmentor,
      ticket_skills: "Rails",
      ticket_location: "Lyon",
      ticket_duration: "1 semaines",
      price: "150€",
      priority: "low",
      status: "Pending",
    )

ticket3 = Ticket.create!(
      title: "pbm avec n git push",
      alumni_id: mat.id,
      mentor_profil: isamentor,
      ticket_skills: "Git",
      ticket_location: "Paris",
      ticket_duration: "3 mois",
      price: "1300€",
      priority: "High",
      status: "cancelled",
    )

ticket4 = Ticket.create!(
      title: "need help with git xxxxxxxxx",
      alumni_id: moh.id,
      mentor_profil: isamentor,
      ticket_skills: "Git",
      ticket_location: "Marseille",
      ticket_duration: "1 jours",
      price: "30€",
      priority: "high",
      status: "pending",
    )

puts 'Creating Reviews Seeds...'
Review.create!(
      ticket_id: ticket1.id,
      description: "C'est Un Mentor de guedin!!!!!",
      rating: 5
  )
Review.create!(
      ticket_id: ticket2.id,
      description: "C'est Un Mentor bidon!!!!!",
      rating: 1
  )
Review.create!(
      ticket_id: ticket3.id,
      description: "C'est Un Mentor de guedin!!!!!",
      rating: 1
  )
Review.create!(
      ticket_id: ticket4.id,
      description: "Hooops I did it Again!!!!!",
      rating: 4
  )
puts 'Creating XXXXs Seeds...'

puts 'Finished!'
