puts 'Cleaning database...'

Review.destroy_all
Ticket.destroy_all
Tag.destroy_all
Skill.destroy_all
MentorProfil.destroy_all
User.destroy_all



puts 'Creating Users Seeds...'
isa = User.create!(
      email: "iza@gmail.com",
      password: "azerty",
      first_name: "isabelle",
      last_name: "Pontoizeau",
      phone_number: "0612345678",
      address: "12 rue de Marseille 69007 LYON",
      batch_wagon: "121"
)
lah = User.create!(
      email: "lah@gmail.com",
      password: "azerty",
      first_name: "lahbib",
      last_name: "belhaddad",
      phone_number: "0612345679",
      address: "12 rue de la planète Mars 69007 LYON",
      batch_wagon: "111"
)
moh = User.create!(
      email: "moh@gmail.com",
      password: "azerty",
      first_name: "mohamed",
      last_name: "Diop",
      phone_number: "0612345680",
      address: "123 avenue Jean Jaures 69007 LYON",
      batch_wagon: "404"
)

mat = User.create!(
      email: "mat@gmail.com",
      password: "azerty",
      first_name: "Mathieu",
      last_name: "Nicolas",
      phone_number: "0612345681",
      address: "23 rue de Montrochet 69002 LYON",
      batch_wagon: "89"
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
puts 'Creating Tickets Seeds...'
# ticket1 = Ticket.create!(
#       title: "Besoin d'aide pour installer ruby",
#       alumni_id: moh.id,
#       mentor_id: isamentor.id,
#       ticket_skills: "Ruby",
#       ticket_location: "Dakar",
#       ticket_duration: "3 semaines",
#       price: "300€",
#     )
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

puts 'Creating XXXXs Seeds...'

puts 'Creating XXXXs Seeds...'
puts 'Creating XXXXs Seeds...'

puts 'Finished!'
