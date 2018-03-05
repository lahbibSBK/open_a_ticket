require 'open-uri'
require 'nokogiri'
require 'json'
require 'faker'

puts 'Cleaning database...'

Review.destroy_all
Ticket.destroy_all
MentorProfil.destroy_all
User.destroy_all
Gutentag::Tag.destroy_all

SKILLS = ["HTML", "CSS", "RUBY ON RAILS", "RUBY", "PHP", "IOS", "ANGULAR JS", "PYTHON", "ANDROID", "MYSQL", "WORDPRESS", "XCODE", "JAVA", "C", "NODE JS", "ASP.NET", "BOOTSTRAP", "SHOPIFY", "GITHUB", "GO", "HEROKU", "REACT", "MONGO DB", "MAGENTO", "POSTGRESQL", "SEO", "UX/UI" ]

SKILLS.each do |tag_name|
  Gutentag::Tag.create(name: tag_name)
end

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
    batch_wagon: student["camp_name"],
    pic_url: student["avatar"],
    speaking_language: ["fr", "gb"]
  )
end

jos = User.create!(
  email: "jos@gmail.com",
  password: "azerty",
  first_name: "joseph",
  last_name: "Blachard",
  phone_number: "0612345677",
  address: "12 rue de saint fons 69007 LYON",
  batch_wagon: "XXX",
  pic_url: "https://avatars3.githubusercontent.com/u/5313828?v=4",
  speaking_language: ["fr","gb", "Esperanto", "Le Mec bourré"]
)
josephmentor = MentorProfil.create!(
  experience: "J'ai appelé némo en vain, alors je suis devenu développeur fullstack",
  minimum_price: "50",
  user_id: jos.id,
  tag_names: SKILLS.sample(4)
)

kev = User.create!(
  email: "kev@gmail.com",
  password: "azerty",
  first_name: "kévin",
  last_name: "Chavanne",
  phone_number: "0612345676",
  address: "12 rue de saint fons 42001  saint-étienne",
  batch_wagon: "XYX",
  pic_url: "https://avatars1.githubusercontent.com/u/472453?v=4",
  speaking_language: ["fr", "gb", "Esperanto", "Le Stephanois", "Le Lyonnais mais sous la torture"]
)
kevinmentor = MentorProfil.create!(
  experience: "Paraît-il que je ne suis pas très à l'écoute de mes étudiantes concernant l'apprentissage du twerk",
  minimum_price: "100",
  tag_names: SKILLS.sample(4),
  user_id: kev.id
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
  pic_url: "https://avatars2.githubusercontent.com/u/34674849?v=4",
  speaking_language: ["fr", "gb", "Esperanto", "Le Mec bourré"]
)
lah = User.create!(
  email: "lah@gmail.com",
  password: "azerty",
  first_name: "lahbib2",
  last_name: "belhaddad2",
  phone_number: "0612345679",
  address: "12 rue de la planète Mars 69007 LYON",
  batch_wagon: "111",
  pic_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/evqefyvpwl5csouogibi.jpg",
  speaking_language: ["fr", "gb", "Esperanto", "Le Mec bourré"],
)
moh = User.create!(
  email: "moh@gmail.com",
  password: "azerty",
  first_name: "mohamed2",
  last_name: "Diop2",
  phone_number: "0612345680",
  address: "123 avenue Jean Jaures 69007 LYON",
  batch_wagon: "404",
  pic_url: "https://avatars2.githubusercontent.com/u/30232344?v=4",
  speaking_language: ["fr", "gb", "Esperanto", "wolof"],
)

mat = User.create!(
  email: "mat@gmail.com",
  password: "azerty",
  first_name: "Mathieu2",
  last_name: "Nicolas2",
  phone_number: "0612345681",
  address: "23 rue de Montrochet 69002 LYON",
  batch_wagon: "89",
  pic_url: "https://avatars3.githubusercontent.com/u/31872246?v=4",
  speaking_language: ["fr", "gb", "Esperanto", "Le Mec bourré"],
)

puts 'Creating Tickets Seeds...'
ticket1 = Ticket.create!(
  title: "Besoin d'aide pour installer ruby",
  alumni_id: moh.id,
  content: Faker::HowIMetYourMother.quote,
  tag_names: SKILLS.sample(4),
  ticket_location: "Dakar",
  ticket_duration: "3 semaines",
  price: "300",
  priority: "low",
  status: "closed",
  speaking_language: ["fr", "gb", "Esperanto", "Le Mec bourré"],
)

ticket2 = Ticket.create!(
  title: "Pundit apparaît Alors que je penser ne pas l'avoir installer",
  alumni_id: lah.id,
  content: Faker::HowIMetYourMother.quote,
  tag_names: SKILLS.sample(4),
  ticket_location: "Lyon",
  ticket_duration: "1 semaines",
  price: "15",
  priority: "low",
  status: "pending",
  speaking_language: ["fr", "gb", "Esperanto", "Le Mec bourré"],
)

ticket3 = Ticket.create!(
  title: "pbm avec n git push",
  alumni_id: mat.id,
  content: Faker::HowIMetYourMother.quote,
  tag_names: SKILLS.sample(4),
  ticket_location: "Paris",
  ticket_duration: "3 mois",
  price: "1300€",
  priority: "High",
  status: "cancelled",
)

ticket4 = Ticket.create!(
  title: "need help with git xxxxxxxxx",
  alumni_id: moh.id,
  content: Faker::HowIMetYourMother.quote,
  tag_names: SKILLS.sample(4),
  ticket_location: "Marseille",
  ticket_duration: "1 jours",
  price: "30€",
  priority: "high",
  status: "Pending",
  speaking_language: ["fr", "gb", "Esperanto", "Le Mec bourré"],
)

puts 'Creating Reviews Seeds...'
Review.create!(
  ticket_id: ticket1.id,
  description: "C'est Une Mentor de guedine!!!!!",
  rating: 5
)
Review.create!(
  ticket_id: ticket2.id,
  description: "C'est Un Mentor génialissime!!!!!",
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
puts 'Creating ...'
toto = ["fr", "gb"]
SKILL = ['HTML', 'CSS', 'RUBY ON RAILS', 'RUBY', 'PHP', 'IOS', 'ANGULAR JS', 'PYTHON', 'ANDROID', 'MYSQL', 'WORDPRESS', 'XCODE', 'JAVA', 'C', 'NODE JS', 'ASP.NET', 'BOOTSTRAP', 'SHOPIFY', 'GITHUB', 'GO', 'HEROKU', 'REACT', 'MONGO DB', 'MAGENTO', 'POSTGRESQL', 'SEO', 'UX/UI']
puts 'Creating X-Seeds (Users as Mentor/ Ticket Open/pending/closed / Review...'
User.all.each do |user|
  if user.last_name.downcase.exclude?("pontoizeau")
    mentor = MentorProfil.create!(
      experience: Faker::ChuckNorris.fact,
      minimum_price: Faker::Number.number(2),
      user_id: user.id,
      tag_names: SKILLS.sample(4)
    )
    #seed ticket closed avec Reviews
    3.times do
      toto = ["fr", "gb"]
      rand(4).times do
          toto << Faker::Address.country_code
      end
      ticket = Ticket.create!(
        title: Faker::DrWho.quote,
        alumni_id: isa.id,
        mentor: mentor.user,
        content: Faker::HowIMetYourMother.quote,
        tag_names: SKILLS.sample(4),
        ticket_location: Faker::Address.city,
        ticket_duration: "#{rand(52)} semaines",
        price: Faker::Number.number(2),
        priority: ["low", "medium", "high"].sample,
        status: "closed",
        speaking_language: toto,
      )

      Review.create!(
        ticket_id: ticket.id,
        description: Faker::BackToTheFuture.quote,
        rating: rand(1..5).to_i
      )
    end
#ticket sans mentor donc sans review
    3.times do
      toto = ["fr", "gb"]
      rand(4).times do
        toto << Faker::Address.country_code
      end
      ticket23 = Ticket.create!(
        title: Faker::HowIMetYourMother.quote,
        alumni_id: isa.id,
        content: Faker::HowIMetYourMother.quote,
        tag_names: SKILLS.sample(4),
        ticket_location: Faker::Address.city,
        ticket_duration: "#{rand(52)} semaines",
        price: Faker::Number.number(2),
        priority: ["low", "medium", "high"].sample,
        status: "open",
        speaking_language: toto,
      )
    end
#ticket en attente de Review
    3.times do
      toto = ["fr", "gb"]
      rand(4).times do
        toto << Faker::Address.country_code
      end
      ticket34 = Ticket.create!(
        title: Faker::DrWho.quote,
        alumni_id: isa.id,
        mentor: mentor.user,
        content: Faker::HowIMetYourMother.quote,
        tag_names: SKILLS.sample(4),
        ticket_location: Faker::Address.city,
        ticket_duration: "#{rand(52)} semaines",
        price: Faker::Number.number(2),
        priority: ["low", "medium", "high"].sample,
        status: "pending",
        speaking_language: toto,
      )
    end
  end
end

davidhass = User.create!(
  email: "mickael.long@flag.org",
  password: "azerty",
  first_name: "Mickael",
  last_name: "LONG",
  phone_number: "0612345600",
  address: "the Foundation for Law and Government (FLAG) XXXXX In the Truck",
  batch_wagon: "001",
  pic_url: "http://idata.over-blog.com/1/71/60/02//228011-david_hasselhoff_RED.jpg",
  speaking_language: ["fr", "gb", "ma", "Le Voiture", "Le Mec bourré"]
)
davidmentor = MentorProfil.create!(
  experience: "a modern-day crime fighter who uses a technologically advanced, artificially intelligent automobile. I worked at
  the Foundation for Law and Government (FLAG). Don't shoot at my pretty face",
  minimum_price: "25",
  user_id: davidhass.id,
  tag_names: SKILLS.sample(4)
)

puts 'Creating X-Seeds with TA & previous Batch...'
puts 'Creating Users for 89 batch students'
users89 = []
students89 = ["mathieuabeille","fbuffin69","marcothiry","gcrouillere","ben7x7","valentinelanger","laetisa","cartosnet","BeGreg","TiphanieTourniaire","Matt196","AurelDbs","HHGB12","Groliver7","knopfler81","Polo2","Mayat90","GuillaumeGrand","Papyarthurus","AntoineMrx","anthonyluc","lenarw","NatachaDucre",
"slaoprp","mlakebo","amtde","RoxaneMar","JKZ888"]
students89.each do |element|
  url = "https://kitt.lewagon.com/api/v1/users/#{element}"
  student_url = open(url, "Cookie" => COOKIES).read
  student = JSON.parse(student_url)
  users89 << User.create!(
    email: student["email"],
    password: "azerty",
    first_name: student["first_name"],
    last_name: student["last_name"],
    phone_number: student["phone"],
    batch_wagon: student["camp_name"],
    pic_url: student["avatar"],
    speaking_language: ["fr", "gb"],
  )
end

mentor89 = []
mentor89github =["clement1234","crionline38","ldeld","Lafiente","antoinecld","Ayliane","BaptPrn"]
mentor89github.each do |element|
  url = "https://kitt.lewagon.com/api/v1/users/#{element}"
  mentor_url = open(url, "Cookie" => COOKIES).read
  mentor = JSON.parse(mentor_url)
  toto = ["fr", "gb"]
  rand(4).times do
    toto << Faker::Address.country_code
  end
  userm = User.create!(
    email: mentor["email"],
    password: "azerty",
    first_name: mentor["first_name"],
    last_name: mentor["last_name"],
    phone_number: mentor["phone"],
    batch_wagon: mentor["camp_name"],
    pic_url: mentor["avatar"],
    speaking_language: toto,
  )

  mentor = MentorProfil.create!(
    experience: Faker::ChuckNorris.fact,
    minimum_price: Faker::Number.number(2),
    user_id: userm.id
  )
  mentor89 << mentor
end
    #seed ticket closed avec Reviews
    50.times do
      toto = ["fr", "gb"]
      rand(4).times do
        toto << Faker::Address.country_code
      end
      ticket = Ticket.create!(
        title: Faker::HowIMetYourMother.quote,
        alumni_id: users89.sample.id,
        mentor: mentor89.sample.user,
        content: Faker::HowIMetYourMother.quote,
        tag_names: SKILLS.sample(3),
        ticket_location: Faker::Address.city,
        ticket_duration: "#{rand(52)} semaines",
        price: Faker::Number.number(2),
        priority: ["low", "medium", "high"].sample,
        status: "closed",
        speaking_language: toto,
      )

      Review.create!(
        ticket_id: ticket.id,
        description: Faker::BackToTheFuture.quote,
        rating: rand(1..5).to_i
      )
end



puts 'Finished!'
