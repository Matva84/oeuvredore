require "open-uri"
require "faker"

urls = ["https://images.unsplash.com/photo-1628592102751-ba83b0314276?q=80&w=2897&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://images.unsplash.com/photo-1510627489930-0c1b0bfb6785?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://images.unsplash.com/photo-1613977257592-4871e5fcd7c4?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://res.cloudinary.com/dabkgyd3m/image/upload/v1710860263/0P4rZNMiQJ6bxNk2b9s3_2320f685-5e2a-446b-c956-ccec7626f4fa_cwigap.jpg",
        "https://res.cloudinary.com/dabkgyd3m/image/upload/v1710860414/paris-typical-facade-and-windows-beautiful-buildings-in-the-marais-2AYNDFX_e4ojmp.jpg",
        "https://res.cloudinary.com/dabkgyd3m/image/upload/v1710860208/211891231_srkmot.jpg"
]

list_of_users_pro = []
list_of_users = []
list_of_projects = []
list_of_documents = []
list_of_tasks = []
list_of_reviews = []
list_of_categories = ["Peinture", "Carrelage", "Plomberie", "Eletricité", "Maçonnerie","Climatisation", "Menuiserie", "Jardin", "Démontage", "Montage", "Réception", "Définition"]

puts "Cleaning databases:"
Message.destroy_all
puts "  >> Messages"
Review.destroy_all
puts "  >> Reviews"
Document.destroy_all
puts "  >> Documents"
Task.destroy_all
puts "  >> Tasks"
# Chatroom.destroy.all
puts "  >> Chatrooms"
Project.destroy_all
puts "  >> Projects"
User.destroy_all
puts "  >> Users"

puts "Creating users..."
file = URI.open("https://kitt.lewagon.com/placeholder/users/benoit-mint")
user_bq = User.new(email: "bq@email.com", password: "password", name: "Benoit", pro: true, nickname: "Benoit")
user_bq.photo.attach(io: file, filename: "benoit.png", content_type: "image/png")
user_bq.save!
list_of_users_pro << user_bq

file = URI.open("https://kitt.lewagon.com/placeholder/users/matva84")
user_mv = User.new(email: "mv@email.com", password: "password", name: "Mathieu", pro: true, nickname: "Mathieu")
user_mv.photo.attach(io: file, filename: "mathieu.png", content_type: "image/png")
user_mv.save!
list_of_users_pro << user_mv

file = URI.open("https://kitt.lewagon.com/placeholder/users/guillaumelmt")
user_gl = User.new(email: "gl@email.com", password: "password", name: "Guillaume", pro: true, nickname: "Guillaume")
user_gl.photo.attach(io: file, filename: "guillaume.png", content_type: "image/png")
user_gl.save!
list_of_users_pro << user_gl

file = URI.open("https://kitt.lewagon.com/placeholder/users/franlorf1050")
user_fl = User.new(email: "fl@email.com", password: "password", name: "François", pro: true, nickname: "François")
user_fl.photo.attach(io: file, filename: "francois.png", content_type: "image/png")
user_fl.save!
list_of_users_pro << user_fl
puts "  >> #{list_of_users_pro.count} professionnal user(s) created"

10.times do
  file = URI.open("https://kitt.lewagon.com/placeholder/users/ssaunier")
  nameStr = Faker::Name.name
  user = User.new(email: Faker::Internet.email, password: "password", name: nameStr, nickname: nameStr)
  user.photo.attach(io: file, filename: "sebsatien.png", content_type: "image/png")
  user.save!
  # puts user.id, user.email, user.name
  list_of_users << user
end
puts "  >> #{list_of_users.count} user(s) created"

puts "Creating projects..."
usr = list_of_users[rand(0..list_of_users.count-1)]
file = URI.open(urls[1])
projectbq1 = Project.new(title: "Maison sur l'ile de Ré, à rénover", description: "Rénovation complète de la salle de bain, avec remplacement de la baignoire par une douche, remplacement du carrelage, et installation d'un meuble vasque.", address: "573, avenue de la Corniche, 17940 Rivedoux-Plage", initial_start_at: Date.today-30, initial_end_at: Date.today+30, progress: rand(0..100), customer_budget: 150000, total_expenses: 50000, user: user_bq, customer: usr)
projectbq1.photo.attach(io: file, filename: "renovation.png", content_type: "image/png")
projectbq1.save!
list_of_projects << projectbq1
chatbq1 = Chatroom.create(name: "Maison bq", project: projectbq1)
Message.create(chatroom: chatbq1, user: user_bq, content: "Bonjour #{usr.name}, dans ce chat, nous pourrons échanger à propos de votre projet!")
usr = list_of_users[rand(0..list_of_users.count-1)]
file = URI.open(urls[0])
projectbq2 = Project.new(title: "Appartement à Bordeaux", description: "Rénovation complète de la cuisine, avec remplacement des meubles, remplacement du carrelage, et installation d'un plan de travail.", address: "9, chemin clos des Grenettes, 17740 Sainte-Marie-De-Ré", initial_start_at: Date.today-30, initial_end_at: Date.today+30, progress: rand(0..100), customer_budget: 180000, total_expenses: 50000, user: user_bq, customer: usr)
projectbq2.photo.attach(io: file, filename: "renovation.png", content_type: "image/png")
projectbq2.save!
list_of_projects << projectbq2
chatbq2 = Chatroom.create(name: "Appartement bq", project: projectbq2)
Message.create(chatroom: chatbq2, user: user_bq, content: "Bonjour #{usr.name}, dans ce chat, nous pourrons échanger à propos de votre projet!")
usr = list_of_users[rand(0..list_of_users.count-1)]
file = URI.open(urls[2])
projectbq3 = Project.new(title: "Villa à Nantes, rénovation de la chambre", description: "Rénovation complète de la chambre, avec remplacement du parquet, remplacement de la peinture, et installation d'un dressing.", address: "12 rue de la Grosse Pierre, 17580 Le-Bois-Plage-En-Ré", initial_start_at: Date.today-30, initial_end_at: Date.today+30, progress: rand(0..100), customer_budget: 130000, total_expenses: 30000, user: user_bq, customer: usr)
projectbq3.photo.attach(io: file, filename: "renovation.png", content_type: "image/png")
projectbq3.save!
list_of_projects << projectbq3
chatbq3 = Chatroom.create(name: "Villa bq", project: projectbq3)
Message.create(chatroom: chatbq3, user: user_bq, content: "Bonjour #{usr.name}, dans ce chat, nous pourrons échanger à propos de votre projet!")
usr = list_of_users[rand(0..list_of_users.count-1)]
file = URI.open(urls[3])
projectbq4 = Project.new(title: "Rooftop à Bruxelles", description: "Création d'une armoire sur mesure pour rangement, peinture complète de la cuisine et renforcement électrique ", address: "Rue de Stal 153, 1130 Schaerbeek", initial_start_at: Date.today-30, initial_end_at: Date.today+30, progress: rand(0..100), customer_budget: 150000, total_expenses: 70000, user: user_bq, customer: usr)
projectbq4.photo.attach(io: file, filename: "renovation.jpg", content_type: "image/jpg")
projectbq4.save!
list_of_projects << projectbq4
chatbq4 = Chatroom.create(name: "Rooftop bq", project: projectbq4)
Message.create(chatroom: chatbq4, user: user_bq, content: "Bonjour #{usr.name}, dans ce chat, nous pourrons échanger à propos de votre projet!")
usr = list_of_users[rand(0..list_of_users.count-1)]
file = URI.open(urls[4])
projectbq5 = Project.new(title: "Sous-sol à Paris", description: "Création d'un sous-sol habitable dans un appartement du rez-de-chaussée. Transformation de la cave. Arrivée d'eau et électricité à amener. Ajout d'une toilette et d'un lavabo", address: "Boulevard Saint-Germain 354, 75007", initial_start_at: Date.today-30, initial_end_at: Date.today+30, progress: rand(0..100), customer_budget: 175000, total_expenses: 35000, user: user_bq, customer: usr)
projectbq5.photo.attach(io: file, filename: "renovation.jpg", content_type: "image/jpg")
projectbq5.save!
list_of_projects << projectbq5
chatbq5 = Chatroom.create(name: "Sous-sol bq", project: projectbq5)
Message.create(chatroom: chatbq5, user: user_bq, content: "Bonjour #{usr.name}, dans ce chat, nous pourrons échanger à propos de votre projet!")
usr = list_of_users[rand(0..list_of_users.count-1)]
file = URI.open(urls[5])
projectbq6 = Project.new(title: "Maison de campagne, Saint-Emilion", description: "Aménagement d'une cave à vin pour grand cru classé. Empièrement à prévoir, chambre froide et matériaux thermiques. Système de sécurité à reconnaissance optique.", address: "Rue du clocher 42, 33330 Saint-Emilion", initial_start_at: Date.today-30, initial_end_at: Date.today+30, progress: rand(0..100), customer_budget: 185000, total_expenses: 52000, user: user_bq, customer: usr)
projectbq6.photo.attach(io: file, filename: "renovation.jpg", content_type: "imagejpg")
projectbq6.save!
list_of_projects << projectbq6
chatbq6 = Chatroom.create(name: "Maison de campagne bq", project: projectbq6)
Message.create(chatroom: chatbq6, user: user_bq, content: "Bonjour #{usr.name}, dans ce chat, nous pourrons échanger à propos de votre projet!")

usr = list_of_users[rand(0..list_of_users.count-1)]
file = URI.open(urls[1])
projectmv1 = Project.new(title: "Maison sur l'ile de Ré", description: "Rénovation complète de la salle de bain, avec remplacement de la baignoire par une douche, remplacement du carrelage, et installation d'un meuble vasque.", address: "6, avenue des mésanges, 91190 Gif sur Yvette", initial_start_at: Date.today-30, initial_end_at: Date.today+30, progress: rand(0..100), customer_budget: 150000, total_expenses: 50000, user: user_mv, customer: usr)
projectmv1.photo.attach(io: file, filename: "renovation.png", content_type: "image/png")
projectmv1.save!
list_of_projects << projectmv1
chatmv1 = Chatroom.create(name: "Maison mv", project: projectmv1)
Message.create(chatroom: chatmv1, user: user_mv, content: "Bonjour #{usr.name}, dans ce chat, nous pourrons échanger à propos de votre projet!")
usr = list_of_users[rand(0..list_of_users.count-1)]
file = URI.open(urls[0])
projectmv2 = Project.new(title: "Appartement à Bordeaux", description: "Rénovation complète de la cuisine, avec remplacement des meubles, remplacement du carrelage, et installation d'un plan de travail.", address: "13, rue de Chartres, 91400 Orsay", initial_start_at: Date.today-30, initial_end_at: Date.today+30, progress: rand(0..100), customer_budget: 180000, total_expenses: 50000, user: user_mv, customer: usr)
projectmv2.photo.attach(io: file, filename: "renovation.png", content_type: "image/png")
projectmv2.save!
list_of_projects << projectmv2
chatmv2 = Chatroom.create(name: "Appartement mv", project: projectmv2)
Message.create(chatroom: chatmv2, user: user_mv, content: "Bonjour #{usr.name}, dans ce chat, nous pourrons échanger à propos de votre projet!")
usr = list_of_users[rand(0..list_of_users.count-1)]
file = URI.open(urls[2])
projectmv3 = Project.new(title: "Villa à Nantes, rénovation de la chambre", description: "Rénovation complète de la chambre, avec remplacement du parquet, remplacement de la peinture, et installation d'un dressing.", address: "Route de Vauhallan, 91400 Saclay", initial_start_at: Date.today-30, initial_end_at: Date.today+30, progress: rand(0..100), customer_budget: 130000, total_expenses: 30000, user: user_mv, customer: usr)
projectmv3.photo.attach(io: file, filename: "renovation.png", content_type: "image/png")
projectmv3.save!
list_of_projects << projectmv3
chatmv3 = Chatroom.create(name: "Villa mv", project: projectmv3)
Message.create(chatroom: chatmv3, user: user_mv, content: "Bonjour #{usr.name}, dans ce chat, nous pourrons échanger à propos de votre projet!")
usr = list_of_users[rand(0..list_of_users.count-1)]
file = URI.open(urls[3])
projectmv4 = Project.new(title: "Rooftop à Bruxelles", description: "Création d'une armoire sur mesure pour rangement, peinture complète de la cuisine et renforcement électrique ", address: "Rue de Stal 153, 1130 Schaerbeek", initial_start_at: Date.today-30, initial_end_at: Date.today+30, progress: rand(0..100), customer_budget: 150000, total_expenses: 70000, user: user_mv, customer: usr)
projectmv4.photo.attach(io: file, filename: "renovation.jpg", content_type: "image/jpg")
projectmv4.save!
list_of_projects << projectmv4
chatmv4 = Chatroom.create(name: "Rooftop mv", project: projectmv4)
Message.create(chatroom: chatmv4, user: user_mv, content: "Bonjour #{usr.name}, dans ce chat, nous pourrons échanger à propos de votre projet!")
usr = list_of_users[rand(0..list_of_users.count-1)]
file = URI.open(urls[4])
projectmv5 = Project.new(title: "Sous-sol à Paris", description: "Création d'un sous-sol habitable dans un appartement du rez-de-chaussée. Transformation de la cave. Arrivée d'eau et électricité à amener. Ajout d'une toilette et d'un lavabo", address: "Boulevard Saint-Germain 354, 75007", initial_start_at: Date.today-30, initial_end_at: Date.today+30, progress: rand(0..100), customer_budget: 175000, total_expenses: 35000, user: user_mv, customer: usr)
projectmv5.photo.attach(io: file, filename: "renovation.jpg", content_type: "image/jpg")
projectmv5.save!
list_of_projects << projectmv5
chatmv5 = Chatroom.create(name: "Sous-sol mv", project: projectmv5)
Message.create(chatroom: chatmv5, user: user_mv, content: "Bonjour #{usr.name}, dans ce chat, nous pourrons échanger à propos de votre projet!")
usr = list_of_users[rand(0..list_of_users.count-1)]
file = URI.open(urls[5])
projectmv6 = Project.new(title: "Maison de campagne, Saint-Emilion", description: "Aménagement d'une cave à vin pour grand cru classé. Empièrement à prévoir, chambre froide et matériaux thermiques. Système de sécurité à reconnaissance optique.", address: "Rue du clocher 42, 33330 Saint-Emilion", initial_start_at: Date.today-30, initial_end_at: Date.today+30, progress: rand(0..100), customer_budget: 185000, total_expenses: 52000, user: user_mv, customer: usr)
projectmv6.photo.attach(io: file, filename: "renovation.jpg", content_type: "image/jpg")
projectmv6.save!
list_of_projects << projectmv6
chatmv6 = Chatroom.create(name: "Maison de campagne mv", project: projectmv6)
Message.create(chatroom: chatmv6, user: user_mv, content: "Bonjour #{usr.name}, dans ce chat, nous pourrons échanger à propos de votre projet!")

usr = list_of_users[rand(0..list_of_users.count-1)]
file = URI.open(urls[1])
projectfl1 = Project.new(title: "Maison sur l'ile de Ré", description: "Rénovation complète de la salle de bain, avec remplacement de la baignoire par une douche, remplacement du carrelage, et installation d'un meuble vasque.", address: "10, Grand Place, 1000 Bruxelles", initial_start_at: Date.today-30, initial_end_at: Date.today+30, progress: rand(0..100), customer_budget: 150000, total_expenses: 50000, user: user_fl, customer: usr)
projectfl1.photo.attach(io: file, filename: "renovation.png", content_type: "image/png")
projectfl1.save!
list_of_projects << projectfl1
chatfl1 = Chatroom.create(name: "Maison fl", project: projectfl1)
Message.create(chatroom: chatfl1, user: user_fl, content: "Bonjour #{usr.name}, dans ce chat, nous pourrons échanger à propos de votre projet!")
usr = list_of_users[rand(0..list_of_users.count-1)]
file = URI.open(urls[0])
projectfl2 = Project.new(title: "Appartement à Bordeaux", description: "Rénovation complète de la cuisine, avec remplacement des meubles, remplacement du carrelage, et installation d'un plan de travail.", address: "19, rue Kleindal, 1630 Linkebeek", initial_start_at: Date.today-30, initial_end_at: Date.today+30, progress: rand(0..100), customer_budget: 180000, total_expenses: 50000, user: user_fl, customer: usr)
projectfl2.photo.attach(io: file, filename: "renovation.png", content_type: "image/png")
projectfl2.save!
list_of_projects << projectfl2
chatfl2 = Chatroom.create(name: "Appartement fl", project: projectfl2)
Message.create(chatroom: chatfl2, user: user_fl, content: "Bonjour #{usr.name}, dans ce chat, nous pourrons échanger à propos de votre projet!")
usr = list_of_users[rand(0..list_of_users.count-1)]
file = URI.open(urls[2])
projectfl3 = Project.new(title: "Villa à Nantes, rénovation de la chambre", description: "Rénovation complète de la chambre, avec remplacement du parquet, remplacement de la peinture, et installation d'un dressing.", address: "Fabriekstraat 20, 1652 Beersel", initial_start_at: Date.today-30, initial_end_at: Date.today+30, progress: rand(0..100), customer_budget: 130000, total_expenses: 30000, user: user_fl, customer: usr)
projectfl3.photo.attach(io: file, filename: "renovation.png", content_type: "image/png")
projectfl3.save!
list_of_projects << projectfl3
chatfl3 = Chatroom.create(name: "Villa fl", project: projectfl3)
Message.create(chatroom: chatfl3, user: user_fl, content: "Bonjour #{usr.name}, dans ce chat, nous pourrons échanger à propos de votre projet!")
usr = list_of_users[rand(0..list_of_users.count-1)]
file = URI.open(urls[3])
projectfl4 = Project.new(title: "Rooftop à Bruxelles", description: "Création d'une armoire sur mesure pour rangement, peinture complète de la cuisine et renforcement électrique ", address: "Rue de Stal 153, 1130 Schaerbeek", initial_start_at: Date.today-30, initial_end_at: Date.today+30, progress: rand(0..100), customer_budget: 150000, total_expenses: 70000, user: user_fl, customer: usr)
projectfl4.photo.attach(io: file, filename: "renovation.jpg", content_type: "image/jpg")
projectfl4.save!
list_of_projects << projectfl4
chatfl4 = Chatroom.create(name: "Rooftop fl", project: projectfl4)
Message.create(chatroom: chatfl4, user: user_fl, content: "Bonjour #{usr.name}, dans ce chat, nous pourrons échanger à propos de votre projet!")
usr = list_of_users[rand(0..list_of_users.count-1)]
file = URI.open(urls[4])
projectfl5 = Project.new(title: "Sous-sol à Paris", description: "Création d'un sous-sol habitable dans un appartement du rez-de-chaussée. Transformation de la cave. Arrivée d'eau et électricité à amener. Ajout d'une toilette et d'un lavabo", address: "Boulevard Saint-Germain 354, 75007", initial_start_at: Date.today-30, initial_end_at: Date.today+30, progress: rand(0..100), customer_budget: 175000, total_expenses: 35000, user: user_fl, customer: usr)
projectfl5.photo.attach(io: file, filename: "renovation.jpg", content_type: "image/jpg")
projectfl5.save!
list_of_projects << projectfl5
chatfl5 = Chatroom.create(name: "Sous-sol fl", project: projectfl5)
Message.create(chatroom: chatfl5, user: user_fl, content: "Bonjour #{usr.name}, dans ce chat, nous pourrons échanger à propos de votre projet!")
usr = list_of_users[rand(0..list_of_users.count-1)]
file = URI.open(urls[5])
projectfl6 = Project.new(title: "Maison de campagne, Saint-Emilion", description: "Aménagement d'une cave à vin pour grand cru classé. Empièrement à prévoir, chambre froide et matériaux thermiques. Système de sécurité à reconnaissance optique.", address: "Rue du clocher 42, 33330 Saint-Emilion", initial_start_at: Date.today-30, initial_end_at: Date.today+30, progress: rand(0..100), customer_budget: 185000, total_expenses: 52000, user: user_fl, customer: usr)
projectfl6.photo.attach(io: file, filename: "renovation.jpg", content_type: "image/jpg")
projectfl6.save!
list_of_projects << projectfl6
chatfl6 = Chatroom.create(name: "Maison de campagne fl", project: projectfl6)
Message.create(chatroom: chatfl6, user: user_fl, content: "Bonjour #{usr.name}, dans ce chat, nous pourrons échanger à propos de votre projet!")

usr = list_of_users[rand(0..list_of_users.count-1)]
file = URI.open(urls[1])
projectgl1 = Project.new(title: "Maison sur l'ile de Ré", description: "Rénovation complète de la salle de bain, avec remplacement de la baignoire par une douche, remplacement du carrelage, et installation d'un meuble vasque.", address: "10, Grand Place, 1000 Bruxelles", initial_start_at: Date.today-30, initial_end_at: Date.today+30, progress: rand(0..100), customer_budget: 150000, total_expenses: 50000, user: user_gl, customer: usr)
projectgl1.photo.attach(io: file, filename: "renovation.png", content_type: "image/png")
projectgl1.save!
list_of_projects << projectgl1
chatgl1 = Chatroom.create(name: "Maison gl", project: projectgl1)
Message.create(chatroom: chatgl1, user: user_gl, content: "Bonjour #{usr.name}, dans ce chat, nous pourrons échanger à propos de votre projet!")
usr = list_of_users[rand(0..list_of_users.count-1)]
file = URI.open(urls[0])
projectgl2 = Project.new(title: "Appartement à Bordeaux", description: "Rénovation complète de la cuisine, avec remplacement des meubles, remplacement du carrelage, et installation d'un plan de travail.", address: "19, rue Kleindal, 1630 Linkebeek", initial_start_at: Date.today-30, initial_end_at: Date.today+30, progress: rand(0..100), customer_budget: 180000, total_expenses: 50000, user: user_gl, customer: usr)
projectgl2.photo.attach(io: file, filename: "renovation.png", content_type: "image/png")
projectgl2.save!
list_of_projects << projectgl2
chatgl2 = Chatroom.create(name: "Appartement gl", project: projectgl2)
Message.create(chatroom: chatgl2, user: user_gl, content: "Bonjour #{usr.name}, dans ce chat, nous pourrons échanger à propos de votre projet!")
usr = list_of_users[rand(0..list_of_users.count-1)]
file = URI.open(urls[2])
projectgl3 = Project.new(title: "Villa à Nantes, rénovation de la chambre", description: "Rénovation complète de la chambre, avec remplacement du parquet, remplacement de la peinture, et installation d'un dressing.", address: "Fabriekstraat 20, 1652 Beersel", initial_start_at: Date.today-30, initial_end_at: Date.today+30, progress: rand(0..100), customer_budget: 130000, total_expenses: 30000, user: user_gl, customer: usr)
projectgl3.photo.attach(io: file, filename: "renovation.png", content_type: "image/png")
projectgl3.save!
list_of_projects << projectgl3
chatgl3 = Chatroom.create(name: "Villa gl", project: projectgl3)
Message.create(chatroom: chatgl3, user: user_gl, content: "Bonjour #{usr.name}, dans ce chat, nous pourrons échanger à propos de votre projet!")
usr = list_of_users[rand(0..list_of_users.count-1)]
file = URI.open(urls[3])
projectgl4 = Project.new(title: "Rooftop à Bruxelles", description: "Création d'une armoire sur mesure pour rangement, peinture complète de la cuisine et renforcement électrique ", address: "Rue de Stal 153, 1130 Schaerbeek", initial_start_at: Date.today-30, initial_end_at: Date.today+30, progress: rand(0..100), customer_budget: 150000, total_expenses: 70000, user: user_gl, customer: usr)
projectgl4.photo.attach(io: file, filename: "renovation.jpg", content_type: "image/jpg")
projectgl4.save!
list_of_projects << projectgl4
chatgl4 = Chatroom.create(name: "Rooftop gl", project: projectgl4)
Message.create(chatroom: chatgl4, user: user_gl, content: "Bonjour #{usr.name}, dans ce chat, nous pourrons échanger à propos de votre projet!")
usr = list_of_users[rand(0..list_of_users.count-1)]
file = URI.open(urls[4])
projectgl5 = Project.new(title: "Sous-sol à Paris", description: "Création d'un sous-sol habitable dans un appartement du rez-de-chaussée. Transformation de la cave. Arrivée d'eau et électricité à amener. Ajout d'une toilette et d'un lavabo", address: "Boulevard Saint-Germain 354, 75007", initial_start_at: Date.today-30, initial_end_at: Date.today+30, progress: rand(0..100), customer_budget: 175000, total_expenses: 35000, user: user_gl, customer: usr)
projectgl5.photo.attach(io: file, filename: "renovation.jpg", content_type: "image/jpg")
projectgl5.save!
list_of_projects << projectgl5
chatgl5 = Chatroom.create(name: "Sous-sol gl", project: projectgl5)
Message.create(chatroom: chatgl5, user: user_gl, content: "Bonjour #{usr.name}, dans ce chat, nous pourrons échanger à propos de votre projet!")
usr = list_of_users[rand(0..list_of_users.count-1)]
file = URI.open(urls[5])
projectgl6 = Project.new(title: "Maison de campagne, Saint-Emilion", description: "Aménagement d'une cave à vin pour grand cru classé. Empièrement à prévoir, chambre froide et matériaux thermiques. Système de sécurité à reconnaissance optique.", address: "Rue du clocher 42, 33330 Saint-Emilion", initial_start_at: Date.today-30, initial_end_at: Date.today+30, progress: rand(0..100), customer_budget: 185000, total_expenses: 52000, user: user_gl, customer: usr)
projectgl6.photo.attach(io: file, filename: "renovation.jpg", content_type: "image/jpg")
projectgl6.save!
list_of_projects << projectgl6
chatgl6 = Chatroom.create(name: "Maison de campagne gl", project: projectgl6)
Message.create(chatroom: chatgl6, user: user_gl, content: "Bonjour #{usr.name}, dans ce chat, nous pourrons échanger à propos de votre projet!")

puts "  >> #{Project.count} project(s) created"

puts "Creating tasks..."
i = 0
6.times do
  puts("NUMERO INDENTATION : #{i}")
  debut = Date.today-rand(0..90)
  fin = debut + rand(1..180)
  task1bq = Task.create(name: "Définition du projet",description: "Réunion de lancement",category: "Définition",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, project: list_of_projects[i])
  task1mv = Task.create(name: "Définition du projet",description: "Réunion de lancement",category: "Définition",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, project: list_of_projects[i+6])
  task1fl = Task.create(name: "Définition du projet",description: "Réunion de lancement",category: "Définition",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, project: list_of_projects[i+12])
  task1gl = Task.create(name: "Définition du projet",description: "Réunion de lancement",category: "Définition",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, project: list_of_projects[i+18])
  puts ("définition")
  puts(task1bq.id, task1mv.id, task1fl.id, task1gl.id)
  debut = fin
  fin = debut + rand(0..10)
  task2bq = Task.create(name: "Devis",description: "Phase de demande/reception des devis",category: "Définition",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task1bq.id, project: list_of_projects[i])
  task2mv = Task.create(name: "Devis",description: "Phase de demande/reception des devis",category: "Définition",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task1mv.id, project: list_of_projects[i+6])
  task2fl = Task.create(name: "Devis",description: "Phase de demande/reception des devis",category: "Définition",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task1fl.id, project: list_of_projects[i+12])
  task2gl = Task.create(name: "Devis",description: "Phase de demande/reception des devis",category: "Définition",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task1gl.id, project: list_of_projects[i+18])
  puts ("devisn")
  puts(task2bq.id, task2mv.id, task2fl.id, task2gl.id)
  debut = fin
  fin = debut + rand(0..30)
  task3bq = Task.create(name: "Dépose",description: "Démontage de l'existant",category: "Démontage",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task2bq.id, project: list_of_projects[i])
  task3mv = Task.create(name: "Dépose",description: "Démontage de l'existant",category: "Démontage",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task2mv.id, project: list_of_projects[i+6])
  task3fl = Task.create(name: "Dépose",description: "Démontage de l'existant",category: "Démontage",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task2fl.id, project: list_of_projects[i+12])
  task3gl = Task.create(name: "Dépose",description: "Démontage de l'existant",category: "Démontage",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task2gl.id, project: list_of_projects[i+18])
  puts ("dépose")
  puts(task3bq.id, task3mv.id, task3fl.id, task3gl.id)
  debut = fin
  fin = debut + rand(0..30)
  task4bq = Task.create(name: "Gros oeuvre",description: "Ouvertures des murs",category: "Plomberie",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task3bq.id, project: list_of_projects[i])
  task4mv = Task.create(name: "Gros oeuvre",description: "Ouvertures des murs",category: "Plomberie",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task3mv.id, project: list_of_projects[i+6])
  task4fl = Task.create(name: "Gros oeuvre",description: "Ouvertures des murs",category: "Plomberie",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task3gl.id, project: list_of_projects[i+12])
  task4gl = Task.create(name: "Gros oeuvre",description: "Ouvertures des murs",category: "Plomberie",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task3gl.id, project: list_of_projects[i+18])
  puts ("gros oeuvre")
  puts(task4bq.id, task4mv.id, task4fl.id, task4gl.id)
  debut = fin
  fin = debut + rand(0..30)
  task5bq = Task.create(name: "Menuiseries",description: "Passage des nouveaux câbles",category: "Electricité",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task4bq.id, project: list_of_projects[i])
  task5mv = Task.create(name: "Menuiseries",description: "Passage des nouveaux câbles",category: "Electricité",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task4mv.id, project: list_of_projects[i+6])
  task5fl = Task.create(name: "Menuiseries",description: "Passage des nouveaux câbles",category: "Electricité",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task4fl.id, project: list_of_projects[i+12])
  task5gl = Task.create(name: "Menuiseries",description: "Passage des nouveaux câbles",category: "Electricité",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task4gl.id, project: list_of_projects[i+18])
  puts ("menuiseries")
  puts(task5bq.id, task5mv.id, task5fl.id, task5gl.id)
  debut = fin
  fin = debut + rand(0..30)
  task6bq = Task.create(name: "Isolation",description: "Pose carrelage sol & murs",category: "Carrelage",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task5bq.id, project: list_of_projects[i])
  task6mv = Task.create(name: "Isolation",description: "Pose carrelage sol & murs",category: "Carrelage",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task5mv.id, project: list_of_projects[i+6])
  task6fl = Task.create(name: "Isolation",description: "Pose carrelage sol & murs",category: "Carrelage",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task5fl.id, project: list_of_projects[i+12])
  task6gl = Task.create(name: "Isolation",description: "Pose carrelage sol & murs",category: "Carrelage",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task5gl.id, project: list_of_projects[i+18])
  puts ("isolation")
  puts(task6bq.id, task6mv.id, task6fl.id, task6gl.id)
  debut = fin
  fin = debut + rand(0..30)
  task7bq = Task.create(name: "Réseaux",description: "Peinture des murs",category: "Peinture",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task6bq.id, project: list_of_projects[i])
  task7mv = Task.create(name: "Réseaux",description: "Peinture des murs",category: "Peinture",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task6mv.id, project: list_of_projects[i+6])
  task7fl = Task.create(name: "Réseaux",description: "Peinture des murs",category: "Peinture",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task6fl.id, project: list_of_projects[i+12])
  task7gl = Task.create(name: "Réseaux",description: "Peinture des murs",category: "Peinture",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task6gl.id, project: list_of_projects[i+18])
  puts ("réseaux")
  puts(task7bq.id, task7mv.id, task7fl.id, task7gl.id)
  debut = fin
  fin = debut + rand(0..30)
  task8bq = Task.create(name: "Revetements",description: "Assemblage des meubles",category: "Montage",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task7bq.id, project: list_of_projects[i])
  task8mv = Task.create(name: "Revetements",description: "Assemblage des meubles",category: "Montage",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task7mv.id, project: list_of_projects[i+6])
  task8fl = Task.create(name: "Revetements",description: "Assemblage des meubles",category: "Montage",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task7fl.id, project: list_of_projects[i+12])
  task8gl = Task.create(name: "Revetements",description: "Assemblage des meubles",category: "Montage",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task7gl.id, project: list_of_projects[i+18])
  puts ("revetement")
  puts(task8bq.id, task8mv.id, task8fl.id, task8gl.id)
  debut = fin
  fin = debut + rand(0..10)
  task9bq = Task.create(name: "Réception",description: "Réception de fin de chantier",category: "Réception",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task8bq.id, project: list_of_projects[i])
  task9mv = Task.create(name: "Réception",description: "Réception de fin de chantier",category: "Réception",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task8mv.id, project: list_of_projects[i+6])
  task9fl = Task.create(name: "Réception",description: "Réception de fin de chantier",category: "Réception",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task8fl.id, project: list_of_projects[i+12])
  task9gl = Task.create(name: "Réception",description: "Réception de fin de chantier",category: "Réception",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task8gl.id, project: list_of_projects[i+18])
  puts ("réception")
  puts(task9bq.id, task9mv.id, task9fl.id, task9gl.id)
  i += 1
end
puts "  >> #{Task.count} task(s) created"

puts "Creating documents..."
puts "  >> #{Document.count} document(s) created"

puts "Creating reviews..."
  rev1bq = Review.create(user: user_bq, project: projectbq1, rating:5, content:"Le projet s'est déroulé dans les contraintes de temps/budget définies à l'origine, merci!!!")
  rev2bq = Review.create(user: user_bq, project: projectbq2, rating:4, content:"Un petit écart de planning...")
  rev3bq = Review.create(user: user_bq, project: projectbq3, rating:5, content:"On ne peut rêver mieux!")

  rev1mv = Review.create(user: user_mv, project: projectmv1, rating:5, content:"Le projet s'est déroulé dans les contraintes de temps/budget définies à l'origine, merci!!!")
  rev2mv = Review.create(user: user_mv, project: projectmv2, rating:4, content:"Un petit écart de planning...")
  rev3mv = Review.create(user: user_mv, project: projectmv3, rating:5, content:"On ne peut rêver mieux!")

  rev1fl = Review.create(user: user_fl, project: projectfl1, rating:5, content:"Le projet s'est déroulé dans les contraintes de temps/budget définies à l'origine, merci!!!")
  rev2fl = Review.create(user: user_fl, project: projectfl2, rating:4, content:"Un petit écart de planning...")
  rev3fl = Review.create(user: user_fl, project: projectfl3, rating:5, content:"On ne peut rêver mieux!")

  rev1gl = Review.create(user: user_gl, project: projectgl1, rating:5, content:"Le projet s'est déroulé dans les contraintes de temps/budget définies à l'origine, merci!!!")
  rev2gl = Review.create(user: user_gl, project: projectgl2, rating:4, content:"Un petit écart de planning...")
  rev3gl = Review.create(user: user_gl, project: projectgl3, rating:5, content:"On ne peut rêver mieux!")
puts "  >> #{Review.count} review(s) created"
puts "Finished!"
