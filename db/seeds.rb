require "open-uri"
require "faker"

list_of_users_pro = []
list_of_users = []
list_of_projects = []
list_of_documents = []
list_of_tasks = []
list_of_reviews = []
list_of_categories = ["Peinture", "Carrelage", "Plomberie", "Eletricité", "Maçonnerie","Climatisation", "Menuiserie", "Jardin", "Démontage", "Montage", "Réception", "Définition"]

puts "Cleaning databases..."
Review.destroy_all
Document.destroy_all
Task.destroy_all
Project.destroy_all
User.destroy_all

puts "Creating users..."
  file = URI.open("https://kitt.lewagon.com/placeholder/users/benoit-mint")
  user_bq = User.new(email: "bq@email.com", password: "password", name: "Benoit", pro: true)
  user_bq.photo.attach(io: file, filename: "benoit.png", content_type: "image/png")
  user_bq.save!
  list_of_users_pro << user_bq

  file = URI.open("https://kitt.lewagon.com/placeholder/users/matva84")
  user_mv = User.new(email: "mv@email.com", password: "password", name: "Mathieu", pro: true)
  user_mv.photo.attach(io: file, filename: "mathieu.png", content_type: "image/png")
  user_mv.save!
  list_of_users_pro << user_mv

  file = URI.open("https://kitt.lewagon.com/placeholder/users/guillaumelmt")
  user_gl = User.new(email: "gl@email.com", password: "password", name: "Guillaume", pro: true)
  user_gl.photo.attach(io: file, filename: "guillaume.png", content_type: "image/png")
  user_gl.save!
  list_of_users_pro << user_gl

  file = URI.open("https://kitt.lewagon.com/placeholder/users/franlorf1050")
  user_fl = User.new(email: "fl@email.com", password: "password", name: "François", pro: true)
  user_fl.photo.attach(io: file, filename: "francois.png", content_type: "image/png")
  user_fl.save!
  list_of_users_pro << user_fl
  puts "  >> #{list_of_users_pro.count} professionnal user(s) created"

  10.times do
    file = URI.open("https://kitt.lewagon.com/placeholder/users/ssaunier")
    user = User.new(email: Faker::Internet.email, password: "password", name: Faker::Name.name)
    user.photo.attach(io: file, filename: "sebsatien.png", content_type: "image/png")
    user.save!
    list_of_users << user
  end
  puts "  >> #{list_of_users.count} user(s) created"

puts "Creating projects..."
  projectbq1 = Project.new(title: "Maison sur l'ile de Ré, à rénover", description: "Rénovation complète de la salle de bain, avec remplacement de la baignoire par une douche, remplacement du carrelage, et installation d'un meuble vasque.", address: "573, avenue de la Corniche, 17940 Rivedoux-Plage", initial_start_at: Date.today-30, initial_end_at: Date.today+30, progress: rand(0..100), customer_budget: 5000, total_expenses: 1000, user: user_bq, customer_id: list_of_users[rand(0..list_of_users.count-1)])
  projectbq1.save!
  list_of_projects << projectbq1
  projectbq2 = Project.new(title: "Appartement à Bordeaux", description: "Rénovation complète de la cuisine, avec remplacement des meubles, remplacement du carrelage, et installation d'un plan de travail.", address: "9, chemin clos des Grenettes, 17740 Sainte-Marie-De-Ré", initial_start_at: Date.today-30, initial_end_at: Date.today+30, progress: rand(0..100), customer_budget: 8000, total_expenses: 5000, user: user_bq, customer_id: list_of_users[rand(0..list_of_users.count-1)])
  projectbq2.save!
  list_of_projects << projectbq2
  projectbq3 = Project.new(title: "Villa à Nantes, rénovation de la chambre", description: "Rénovation complète de la chambre, avec remplacement du parquet, remplacement de la peinture, et installation d'un dressing.", address: "12 rue de la Grosse Pierre, 17580 Le-Bois-Plage-En-Ré", initial_start_at: Date.today-30, initial_end_at: Date.today+30, progress: rand(0..100), customer_budget: 3000, total_expenses: 1000, user: user_bq, customer_id: list_of_users[rand(0..list_of_users.count-1)])
  projectbq3.save!
  list_of_projects << projectbq3

  projectmv1 = Project.new(title: "Maison sur l'ile de Ré", description: "Rénovation complète de la salle de bain, avec remplacement de la baignoire par une douche, remplacement du carrelage, et installation d'un meuble vasque.", address: "6, avenue des mésanges, 91190 Gif sur Yvette", initial_start_at: Date.today-30, initial_end_at: Date.today+30, progress: rand(0..100), customer_budget: 5000, total_expenses: 1000, user: user_mv, customer_id: list_of_users[rand(0..list_of_users.count-1)])
  projectmv1.save!
  list_of_projects << projectmv1
  projectmv2 = Project.new(title: "Appartement à Bordeaux", description: "Rénovation complète de la cuisine, avec remplacement des meubles, remplacement du carrelage, et installation d'un plan de travail.", address: "13, rue de Chartres, 91400 Orsay", initial_start_at: Date.today-30, initial_end_at: Date.today+30, progress: rand(0..100), customer_budget: 8000, total_expenses: 5000, user: user_mv, customer_id: list_of_users[rand(0..list_of_users.count-1)])
  projectmv2.save!
  list_of_projects << projectmv2
  projectmv3 = Project.new(title: "Villa à Nantes, rénovation de la chambre", description: "Rénovation complète de la chambre, avec remplacement du parquet, remplacement de la peinture, et installation d'un dressing.", address: "Route de Vauhallan, 91400 Saclay", initial_start_at: Date.today-30, initial_end_at: Date.today+30, progress: rand(0..100), customer_budget: 3000, total_expenses: 1000, user: user_mv, customer_id: list_of_users[rand(0..list_of_users.count-1)])
  projectmv3.save!
  list_of_projects << projectmv3

  projectfl1 = Project.new(title: "Maison sur l'ile de Ré", description: "Rénovation complète de la salle de bain, avec remplacement de la baignoire par une douche, remplacement du carrelage, et installation d'un meuble vasque.", address: "10, Grand Place, 1000 Bruxelles", initial_start_at: Date.today-30, initial_end_at: Date.today+30, progress: rand(0..100), customer_budget: 5000, total_expenses: 1000, user: user_fl, customer_id: list_of_users[rand(0..list_of_users.count-1)])
  projectfl1.save!
  list_of_projects << projectfl1
  projectfl2 = Project.new(title: "Appartement à Bordeaux", description: "Rénovation complète de la cuisine, avec remplacement des meubles, remplacement du carrelage, et installation d'un plan de travail.", address: "19, rue Kleindal, 1630 Linkebeek", initial_start_at: Date.today-30, initial_end_at: Date.today+30, progress: rand(0..100), customer_budget: 8000, total_expenses: 5000, user: user_fl, customer_id: list_of_users[rand(0..list_of_users.count-1)])
  projectfl2.save!
  list_of_projects << projectfl2
  projectfl3 = Project.new(title: "Villa à Nantes, rénovation de la chambre", description: "Rénovation complète de la chambre, avec remplacement du parquet, remplacement de la peinture, et installation d'un dressing.", address: "Fabriekstraat 20, 1652 Beersel", initial_start_at: Date.today-30, initial_end_at: Date.today+30, progress: rand(0..100), customer_budget: 3000, total_expenses: 1000, user: user_fl, customer_id: list_of_users[rand(0..list_of_users.count-1)])
  projectfl3.save!
  list_of_projects << projectfl3

  projectgl1 = Project.new(title: "Maison sur l'ile de Ré", description: "Rénovation complète de la salle de bain, avec remplacement de la baignoire par une douche, remplacement du carrelage, et installation d'un meuble vasque.", address: "10, Grand Place, 1000 Bruxelles", initial_start_at: Date.today-30, initial_end_at: Date.today+30, progress: rand(0..100), customer_budget: 5000, total_expenses: 1000, user: user_gl, customer_id: list_of_users[rand(0..list_of_users.count-1)])
  projectgl1.save!
  list_of_projects << projectgl1
  projectgl2 = Project.new(title: "Appartement à Bordeaux", description: "Rénovation complète de la cuisine, avec remplacement des meubles, remplacement du carrelage, et installation d'un plan de travail.", address: "19, rue Kleindal, 1630 Linkebeek", initial_start_at: Date.today-30, initial_end_at: Date.today+30, progress: rand(0..100), customer_budget: 8000, total_expenses: 5000, user: user_gl, customer_id: list_of_users[rand(0..list_of_users.count-1)])
  projectgl2.save!
  list_of_projects << projectgl2
  projectgl3 = Project.new(title: "Villa à Nantes, rénovation de la chambre", description: "Rénovation complète de la chambre, avec remplacement du parquet, remplacement de la peinture, et installation d'un dressing.", address: "Fabriekstraat 20, 1652 Beersel", initial_start_at: Date.today-30, initial_end_at: Date.today+30, progress: rand(0..100), customer_budget: 3000, total_expenses: 1000, user: user_gl, customer_id: list_of_users[rand(0..list_of_users.count-1)])
  projectgl3.save!
  list_of_projects << projectgl3

puts "  >> #{Project.count} project(s) created"

puts "Creating tasks..."
i = 0
  3.times do
    debut = Date.today-rand(0..90)
    fin = debut + rand(0..10)
    task1bq = Task.create(name: "Définition du projet",description: "Réunion de lancement",category: "Définition",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, project: list_of_projects[i])
    task1mv = Task.create(name: "Définition du projet",description: "Réunion de lancement",category: "Définition",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, project: list_of_projects[i+3])
    task1fl = Task.create(name: "Définition du projet",description: "Réunion de lancement",category: "Définition",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, project: list_of_projects[i+6])
    task1gl = Task.create(name: "Définition du projet",description: "Réunion de lancement",category: "Définition",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, project: list_of_projects[i+9])

    debut = fin
    fin = debut + rand(0..10)
    task2bq = Task.create(name: "Devis",description: "Phase de demande/reception des devis",category: "Définition",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task1bq.id, project: list_of_projects[i])
    task2mv = Task.create(name: "Devis",description: "Phase de demande/reception des devis",category: "Définition",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task1mv.id, project: list_of_projects[i+3])
    task2fl = Task.create(name: "Devis",description: "Phase de demande/reception des devis",category: "Définition",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task1fl.id, project: list_of_projects[i+6])
    task2gl = Task.create(name: "Devis",description: "Phase de demande/reception des devis",category: "Définition",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task1gl.id, project: list_of_projects[i+9])

    debut = fin
    fin = debut + rand(0..30)
    task3bq = Task.create(name: "Dépose",description: "Démontage de l'existant",category: "Démontage",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task2bq.id, project: list_of_projects[i])
    task3mv = Task.create(name: "Dépose",description: "Démontage de l'existant",category: "Démontage",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task2mv.id, project: list_of_projects[i+3])
    task3fl = Task.create(name: "Dépose",description: "Démontage de l'existant",category: "Démontage",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task2fl.id, project: list_of_projects[i+6])
    task3gl = Task.create(name: "Dépose",description: "Démontage de l'existant",category: "Démontage",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task2gl.id, project: list_of_projects[i+9])

    debut = fin
    fin = debut + rand(0..30)
    task4bq = Task.create(name: "Passage tuyaux",description: "Passage des nouveaux tuyaux",category: "Plomberie",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task3bq.id, project: list_of_projects[i])
    task4mv = Task.create(name: "Passage tuyaux",description: "Passage des nouveaux tuyaux",category: "Plomberie",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task3mv.id, project: list_of_projects[i+3])
    task4fl = Task.create(name: "Passage tuyaux",description: "Passage des nouveaux tuyaux",category: "Plomberie",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task3gl.id, project: list_of_projects[i+6])
    task4gl = Task.create(name: "Passage tuyaux",description: "Passage des nouveaux tuyaux",category: "Plomberie",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task3gl.id, project: list_of_projects[i+9])

    debut = fin
    fin = debut + rand(0..30)
    task5bq = Task.create(name: "Passage câbles",description: "Passage des nouveaux câbles",category: "Electricité",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task4bq.id, project: list_of_projects[i])
    task5mv = Task.create(name: "Passage câbles",description: "Passage des nouveaux câbles",category: "Electricité",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task4mv.id, project: list_of_projects[i+3])
    task5fl = Task.create(name: "Passage câbles",description: "Passage des nouveaux câbles",category: "Electricité",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task4fl.id, project: list_of_projects[i+6])
    task5gl = Task.create(name: "Passage câbles",description: "Passage des nouveaux câbles",category: "Electricité",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task4gl.id, project: list_of_projects[i+9])

    debut = fin
    fin = debut + rand(0..30)
    task6bq = Task.create(name: "Carrelage",description: "Pose carrelage sol & murs",category: "Carrelage",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task5bq.id, project: list_of_projects[i])
    task6mv = Task.create(name: "Carrelage",description: "Pose carrelage sol & murs",category: "Carrelage",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task5mv.id, project: list_of_projects[i+3])
    task6fl = Task.create(name: "Carrelage",description: "Pose carrelage sol & murs",category: "Carrelage",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task5fl.id, project: list_of_projects[i+6])
    task6gl = Task.create(name: "Carrelage",description: "Pose carrelage sol & murs",category: "Carrelage",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task5gl.id, project: list_of_projects[i+9])

    debut = fin
    fin = debut + rand(0..30)
    task7bq = Task.create(name: "Peinture",description: "Peinture des murs",category: "Peinture",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task6bq.id, project: list_of_projects[i])
    task7mv = Task.create(name: "Peinture",description: "Peinture des murs",category: "Peinture",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task6mv.id, project: list_of_projects[i+3])
    task7fl = Task.create(name: "Peinture",description: "Peinture des murs",category: "Peinture",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task6fl.id, project: list_of_projects[i+6])
    task7gl = Task.create(name: "Peinture",description: "Peinture des murs",category: "Peinture",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task6gl.id, project: list_of_projects[i+9])

    debut = fin
    fin = debut + rand(0..30)
    task8bq = Task.create(name: "Finitions",description: "Assemblage des meubles",category: "Montage",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task7bq.id, project: list_of_projects[i])
    task8mv = Task.create(name: "Finitions",description: "Assemblage des meubles",category: "Montage",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task7mv.id, project: list_of_projects[i+3])
    task8fl = Task.create(name: "Finitions",description: "Assemblage des meubles",category: "Montage",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task7fl.id, project: list_of_projects[i+6])
    task8gl = Task.create(name: "Finitions",description: "Assemblage des meubles",category: "Montage",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task7gl.id, project: list_of_projects[i+9])

    debut = fin
    fin = debut + rand(0..10)
    task9bq = Task.create(name: "Réception",description: "Réception de fin de chantier",category: "Réception",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task8bq.id, project: list_of_projects[i])
    task9mv = Task.create(name: "Réception",description: "Réception de fin de chantier",category: "Réception",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task8mv.id, project: list_of_projects[i+3])
    task9fl = Task.create(name: "Réception",description: "Réception de fin de chantier",category: "Réception",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task8fl.id, project: list_of_projects[i+6])
    task9gl = Task.create(name: "Réception",description: "Réception de fin de chantier",category: "Réception",progress: rand(0..100),budget: rand(0..20000),start_at: debut, end_at:fin, dependant_from_task_id: task8gl.id, project: list_of_projects[i+9])

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
