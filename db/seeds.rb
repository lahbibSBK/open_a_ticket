require 'open-uri'
require 'nokogiri'
require 'json'
require 'faker'

puts 'Cleaning database...'

Review.destroy_all
Order.destroy_all
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

users121 = []
students.each do |element|
  url = "https://kitt.lewagon.com/api/v1/users/#{element}"
  student_url = open(url, "Cookie" => COOKIES).read
  student = JSON.parse(student_url)
  users121 << User.create!(
    email: student["email"],
    password: "azerty",
    first_name: student["first_name"],
    last_name: student["last_name"],
    phone_number: student["phone"],
    batch_wagon: student["camp_name"],
    pic_url: student["avatar"],
    speaking_language: ["fr", "gb"],
    address: Faker::Address.city,
    slack_id: student["slack_alumni_uid"]
  )
end

jos = User.create!(
  email: "jos@gmail.com",
  password: "azerty",
  first_name: "joseph",
  last_name: "Blanchard",
  phone_number: "0612345677",
  address: "12 rue de saint fons 69007 LYON",
  batch_wagon: "Karr",
  pic_url: "https://avatars3.githubusercontent.com/u/5313828?v=4",
  speaking_language: ["fr","gb", "Esperanto", "Le Mec bourré"],
  slack_id: "U4004D27N",

)
josephmentor = MentorProfil.create!(
  experience: "Actuellement développeur Rails chez Tilkee.
J'ai trouvé ma place dans cette Start-Up. Déjà au niveau technologique, confronté chaque semaines à de nouveaux défis techniques et de nouveaux enjeux, il faut savoir s'adapter, et je trouve ça très stimulant.
De plus dans une petite boîte tout le monde à un rôle à jouer. Il faut donc tous travailler la main dans la main (même avec les commerciaux ^^), remettre en question régulièrement nos process, trouver les outils adaptés.
Chez nous on utilise Slack, Asana et d'autre, des outils modernes, et du coup au quotidien c'est agréable.
Si demain j'ai une idée (et qu'elle est bonne ^^) elle peut être mise en place le surlendemain. (= Salarié heureux :-) )",
  minimum_price: "25",
  user_id: jos.id,
  tag_names: ['HTML', 'CSS', 'RUBY ON RAILS', 'RUBY', 'PHP', 'IOS', 'ANGULAR JS', 'PYTHON', 'ANDROID', 'MYSQL', 'WORDPRESS', 'XCODE', 'JAVA', 'C', 'NODE JS', 'ASP.NET', 'BOOTSTRAP', 'SHOPIFY', 'GITHUB', 'GO', 'HEROKU', 'REACT', 'MONGO DB', 'MAGENTO', 'POSTGRESQL', 'SEO', 'UX/UI']
)

kev = User.create!(
  email: "kev@gmail.com",
  password: "azerty",
  first_name: "kévin",
  last_name: "Chavanne",
  phone_number: "0612345676",
  address: "12 rue du twerk 42001  saint-étienne",
  batch_wagon: "Kitt",
  pic_url: "https://avatars1.githubusercontent.com/u/472453?v=4",
  speaking_language: ["fr", "gb", "es", "ma", "br"]
  slack_id: "U3HFUV8DA",
)
kevinmentor = MentorProfil.create!(
  experience: "Paraît-il que je ne suis pas très à l'écoute de mes étudiantes concernant l'apprentissage du twerk
  Lead Teacher@Le Wagon Lyon Depuis janvier 2017, 
  j’assure la majorité des cours au Wagon Lyon.Le Wagon propose des formations intensives de 9 semaines pour apprendre à développer, maintenir et déployer un produit web.
  Co-GérantCraftsmen 2010 - 2016
  Durant 6 ans, nous avons créé, mon ex associé et moi même une société de développement d’applications webs et mobiles.Nos clients étaient : - Des personnes souhaitant développer un produit web, et nous les accompagnions à la fois sur le côté business, pilotage du produit, mais également sur le développement du premier prototype (MVP), pour leur permettre de valider leur marché.- Des équipes techniques ayant besoin de formations de mise à niveau pour une technologie précise ou d’un accompagnement provisoire sur le développement de leur produit.Ces quelques années nous ont permis d’apprendre plusieurs technologies, en nous apportant le recul nécessaire quant aux choix d’architecture, technologiques, et business à faire.",
  minimum_price: "30",
  tag_names: ['HTML', 'CSS', 'RUBY ON RAILS', 'RUBY', 'PHP', 'IOS', 'ANGULAR JS', 'PYTHON', 'ANDROID', 'MYSQL', 'WORDPRESS', 'XCODE', 'JAVA', 'C', 'NODE JS', 'ASP.NET', 'BOOTSTRAP', 'SHOPIFY', 'GITHUB', 'GO', 'HEROKU', 'REACT', 'MONGO DB', 'MAGENTO', 'POSTGRESQL', 'SEO', 'UX/UI'],
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
  speaking_language: ["fr", "gb", "Esperanto", "Le Mec bourré"],
  #slack_id: student["slack_alumni_uid"],
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

puts 'Creating ...'
toto = ["fr", "gb"]
SKILL = ['HTML', 'CSS', 'RUBY ON RAILS', 'RUBY', 'PHP', 'IOS', 'ANGULAR JS', 'PYTHON', 'ANDROID', 'MYSQL', 'WORDPRESS', 'XCODE', 'JAVA', 'C', 'NODE JS', 'ASP.NET', 'BOOTSTRAP', 'SHOPIFY', 'GITHUB', 'GO', 'HEROKU', 'REACT', 'MONGO DB', 'MAGENTO', 'POSTGRESQL', 'SEO', 'UX/UI']
# puts 'Creating X-Seeds (Users as Mentor/ Ticket Open/pending/closed / Review...'
# User.all.each do |user|
#   if user.last_name.downcase.exclude?("pontoizeau")
#     mentor = MentorProfil.create!(
#       experience: Faker::ChuckNorris.fact,
#       minimum_price: Faker::Number.number(2),
#       user_id: user.id,
#       tag_names: SKILLS.sample(4)
#     )
#     #seed ticket closed avec Reviews
#     3.times do
#       toto = ["fr", "gb"]
#       rand(4).times do
#           toto << Faker::Address.country_code
#       end
#       ticket = Ticket.create!(
#         title: Faker::DrWho.quote,
#         alumni_id: isa.id,

#         content: Faker::HowIMetYourMother.quote,
#         tag_names: SKILLS.sample(4),
#         ticket_location: Faker::Address.city,
#         ticket_duration: "#{rand(52)} semaines",
#         price_cents: Faker::Number.number(2),
#         priority: ["low", "medium", "high"].sample,
#         status: "open",
#         speaking_language: toto,
#       )
#       Review.create!(
#         ticket_id: ticket.id,
#         description: Faker::BackToTheFuture.quote,
#         rating: rand(1..5).to_i
#       )
#     end
# #ticket sans mentor donc sans review
#     3.times do
#       toto = ["fr", "gb"]
#       rand(4).times do
#         toto << Faker::Address.country_code
#       end
#       ticket23 = Ticket.create!(
#         title: Faker::HowIMetYourMother.quote,
#         alumni_id: isa.id,
#         mentor: mentor.user,
#         content: Faker::HowIMetYourMother.quote,
#         tag_names: SKILLS.sample(4),
#         ticket_location: Faker::Address.city,
#         ticket_duration: "#{rand(52)} semaines",
#         price_cents: Faker::Number.number(2),
#         priority: ["low", "medium", "high"].sample,
#         status: "pending",
#         speaking_language: toto,
#       )
#     end
# #ticket en attente de Review
#     3.times do
#       toto = ["fr", "gb"]
#       rand(4).times do
#         toto << Faker::Address.country_code
#       end
#       ticket34 = Ticket.create!(
#         title: Faker::DrWho.quote,
#         alumni_id: isa.id,
#         mentor: mentor.user,
#         content: Faker::HowIMetYourMother.quote,
#         tag_names: SKILLS.sample(4),
#         ticket_location: Faker::Address.city,
#         ticket_duration: "#{rand(52)} semaines",
#         price_cents: Faker::Number.number(2),
#         priority: ["low", "medium", "high"].sample,
#         status: "closed",
#         speaking_language: toto,
#       )
#     end
#   end
# end



davidhass = User.create!(
  email: "mickael.long@flag.org",
  password: "azerty",
  first_name: "Mickael",
  last_name: "LONG",
  phone_number: "0612345600",
  address: "the Foundation for Law and Government (FLAG) XXXXX In the Truck",
  batch_wagon: "001",
  pic_url: "http://idata.over-blog.com/1/71/60/02//228011-david_hasselhoff_RED.jpg",
  speaking_language: ["fr", "gb", "ma", "Le Voiture", "Le Mec bourré"],
  slack_id: "U8NTWTTJL",
)
davidmentor = MentorProfil.create!(
  experience: "a modern-day crime fighter who uses a technologically advanced, artificially intelligent automobile. I worked at
  the Foundation for Law and Government (FLAG). Don't shoot at my pretty face
  I have experience on designing, developing and deploying web-based applications, I have over 2 in building web applications using Ruby on Rails framework. 
Projects from scratch fired me up !!",
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
    address: Faker::Address.city,
    slack_id: student["slack_alumni_uid"]
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
    address: Faker::Address.city,
    slack_id: student["slack_alumni_uid"],
  )

  mentor = MentorProfil.create!(
    experience: Faker::ChuckNorris.fact,
    minimum_price: Faker::Number.number(2),
    user_id: userm.id
  )
  mentor89 << mentor
end


m1 = MentorProfil.where(user: User.where(first_name: "Clément")).first
m1.experience = "Scientific software developer (image processing, data analysis, machine learning & visualisation) and computing using C++, matlab, javascript & web apps.

I've been developing working professionally for over 15 years and have touched all sorts of technologies, APIs, Algorithms, build systems in that time 3D Visualisation, GPU/CUDA, Linux/Windows, boost, node.js, .... 

These days getting into js, node and web technologies. I practice BDD & TDD have led & worked on agile teams and regularly teach people over the internet."
m1.save

m1 = MentorProfil.where(user: User.where(first_name:"GACHET")).first
m1.experience = "For the majority of my career, I have focused on enterprise level applications primarily working with Microsoft tools & technologies. I've been working with Node.js, Angular.js, and other similar frameworks. In particular, I have been working with the MEAN Stack, and have become a main contributor to the project. 

Software development problems are not too different but the infinite ways they can be resolved through new innovative methods inspires me. As a consequence, I have abundant experience in learning new technologies quickly. I may not know the definition of every technical term, but chances are I know it well in practice. I've always had the ability to look at a project from bird's eye view and calculate how any change will affect the project as a whole. I attribute this to an outstanding memory."
m1.save
m1 = MentorProfil.where(user: User.where(first_name: "Lorenzo")).first
m1.experience = "Le Wagon
Nom du diplôme FullStack Developer
Domaine d’études Web Development
Années de fréquentation ou date prévue d’obtention du diplôme 2017 – 2017
Activités et associations :
Attended Le Wagon Lyon #109
9-week intensive coding bootcamp learning HTML, CSS, Bootstrap, JavaScript ES2015, SQL, git, GitHub, Heroku and Ruby on Rails. Designed, Implemented and Shipped to production a clone of AirBnB and a Rails prototype of Lovify
"
m1.save
m1 = MentorProfil.where(user: User.where(first_name: "Laurène")).first
m1.experience = "I am a developer constantly looking elegant solution to solve problems. I have been working on complex application for few years at Microsoft and in software companies.

I am also the lead developer of the Tweetinvi library which you can find on github"
m1.save

m1 = MentorProfil.where(user: User.where(last_name:"Coulaud")).first
m1.experience = "I've been coding since age of 15, starting with perl, moving to php, and finally to python. I've been a freelancer working in the US, New Zealand, Vietnam, and now working in Germany. 

I'm interested in helping people solve their website problems quickly and efficiently. At the moment I focus mostly on python/django, javascript, and to a lesser extend php or wordpress problem. I can also help out with linux system admin questions, more specifically with ubuntu/debian based problems."
m1.save

m1 = MentorProfil.where(user: User.where(last_name:"Loviton")).first
m1.experience = "Hello I am a full-stack web engineer and if I have to pick my top two forte, it would be Ruby on Rails and Nodejs. That being said, front-end technology as well as vim and tmux are second nature to me. Ping me and we can discuss on how I can help you!"
m1.save

m1 = MentorProfil.where(user: User.where(last_name:"Perrin")).first
m1.experience = "I am 2016 graduate batch from LeWagon Lyon having Bachelors degree in Mathematics. From then I have worked with a breadth of companies from software giant EBAY to a 1 year old startups. In EBAY, I have lead a team of 4 engineers. I have solid grasp of software engineering and worked with very interesting technologies."
m1.save

MentorProfil.create!(
  experience: "I am a freelance web developer working out of Morrocco. My weapons of choices are : HTML, CSS, Javascript, SQL, Ruby, Ruby on Rails, React JS. I literally spend as much hours as possible every day on coding.",
  minimum_price: 20,
  user_id: User.where(email:"belhaddadl80@gmail.com").first.id,
  tag_names: ['HTML', 'CSS', 'RUBY ON RAILS', 'RUBY', 'PHP', 'IOS', 'ANGULAR JS', 'PYTHON', 'ANDROID', 'MYSQL', 'WORDPRESS', 'XCODE', 'JAVA', 'C', 'NODE JS', 'ASP.NET', 'BOOTSTRAP', 'SHOPIFY', 'GITHUB', 'GO', 'HEROKU', 'REACT', 'MONGO DB', 'MAGENTO', 'POSTGRESQL', 'SEO', 'UX/UI']
)


# pour le geocoder dans match_mentor
# const = []
# Ticket.all.each do |ticket|
#   if ticket.ticket_location
#     const << ticket.ticket_location
#   end
# end

# const = []
# User.all.each do |user|
#   if user.address && user.mentor_profil != nil
#     const << user.address
#   end
# end

# const = []
# MentorProfil.all.each do |mentor_profil|
#   if mentor_profil.user.address
#     const << mentor_profil.user.address
#   end
# end

puts 'Finished!'
reviewstock =[["Knows his stuff, very quick and professional.",3],
["Another great session with him. Useful and insightful I appreciate his help!",3],
["Always a good experience with him. He is as always very understanding and helpful.",4],
["As always, a great learning experience !",5],
["he is a master Linux pro; easy to work with; highly recommended.",3],
["he is simply awesome and fixed problems where three others couldn't. Really highly recommended",3],
["Excellent. Amazing. He knows what he is talking about. And is truthful when he does not know something.",1],
["kidnly helped us to resolve some issues with our protractor, which was not running due to missing install files",2],
["It is the best mentor I've worked with, surely a great person to learn from.",5],
["Wow. Masterful. I could not recommend more.",3],
["Patient and knowlagable",4],
["Super helpful, great javascript skills.",2],
["Professional, punctual, and courteous. Friendly guy with talent.",4],
["Michael helped me work through Git installation and update issues on Mac OS",2],
["Michael is knowledgeable and knows about Angular, CSS, and Heroku deployment. Very nice and friendly person. He is also someone that has been coding for a while.",2],
["Micheal was a big help. He's very knowledgeable and a good communicator.",4],
["Really great session with Michael. A lot of good communication before session. Starting out, we explored what I was trying to do, and when we hit a little wall, Michael was willing to suspend the session until we got back on track. Then he methodically led me to the right solution. Really like the approach, and will make it my 'leading practice' for testing.",2],
["This guy is awesome. He was extremely helpful, provided example code for reference and helpful links for further reading on topics. He is definitely an expert! I highly recommend.",2],
["It was a pleasure working with Mike. He is very experienced with Node, javascript, and javascript promises. He is also very patient and is an amazing and outstanding mentor. I look forward to working with Mike more over the next few months.",4],
["Excellent help! Solved by problem and gave good advice on Angular handling.",2],
["Amazing mentor!",3],
["The best CodeMentor of all time.",4],
["he was a great in helping me solve a business issue I was stuck on with my Rails application. He quickly understood my needs and was a pleasure to work with. Would highly recommend.",5],
["Fast and effective. : )",2],
["he is terrific! Thank you so much for your help! Really knowledgeable, really quick and really professional! Many kudos!",3],
["I feel very pleased with the help he provided.",4],
["Master at work...",5],
["Awesome help! really sat me through a bug that took ages to fix and solved it with me.",2],
["Best session I've had so far",3],
["he was a big help with a Slack bot I am building!",5]
]

#seed ticket closed avec Reviews
mentorall = MentorProfil.all
100.times do
  ticket = []
      toto = ["fr", "gb"]
      rand(4).times do
        toto << Faker::Address.country_code
      end
      ticket = Ticket.create!(
        title: Faker::ChuckNorris.fact,
        alumni_id: users89.sample.id,
        mentor: mentorall.sample.user,
        content: Faker::HowIMetYourMother.quote,
        tag_names: SKILLS.sample(3),
        ticket_location: Faker::Address.city,
        ticket_duration: "#{rand(52)} hours",
        price_cents: Faker::Number.number(2),
        priority: ["low", "medium", "high"].sample,
        status: "closed",
        speaking_language: toto,
      )

      Review.create!(
        ticket_id: ticket.id,
        description: reviewstock.sample[0],
        rating: rand(1..5).to_i
      )
end