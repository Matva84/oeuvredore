require "open-uri"
require "faker"

list_of_users = []
list_of_projects = []
list_of_documents = []
list_of_tasks = []
list_of_reviews = []
list_of_categories = ["Peinture", "Plomberie", "Eletricité", "Maçonnerie","Climatisation", "Menuiserie", "Jardin"]

puts "Cleaning databases..."
Document.destroy_all
Task.destroy_all
Project.destroy_all
Review.destroy_all
User.destroy_all

puts "Creating users..."
  file = URI.open("https://kitt.lewagon.com/placeholder/users/benoit-mint")
  user_bq = User.new(email: "bq@email.com", password: "password", name: "Benoit", pro: true)
  user_bq.photo.attach(io: file, filename: "benoit.png", content_type: "image/png")
  user_bq.save!
  list_of_users << user_bq

  file = URI.open("https://kitt.lewagon.com/placeholder/users/matva84")
  user_mv = User.new(email: "mv@email.com", password: "password", name: "Mathieu", pro: true)
  user_mv.photo.attach(io: file, filename: "mathieu.png", content_type: "image/png")
  user_mv.save!
  list_of_users << user_mv

  file = URI.open("https://kitt.lewagon.com/placeholder/users/guillaumelmt")
  user_gl = User.new(email: "gl@email.com", password: "password", name: "Guillaume", pro: true)
  user_gl.photo.attach(io: file, filename: "guillaume.png", content_type: "image/png")
  user_gl.save!
  list_of_users << user_gl

  file = URI.open("https://kitt.lewagon.com/placeholder/users/franlorf1050")
  user_fl = User.new(email: "fl@email.com", password: "password", name: "François", pro: true)
  user_fl.photo.attach(io: file, filename: "francois.png", content_type: "image/png")
  user_fl.save!
  list_of_users << user_fl

#  10.times do
#    # user = User.create(email: Faker::Internet.email, password: "password", name: Faker::Name.name, pro: false)
#    file = URI.open("https://kitt.lewagon.com/placeholder/users/ssaunier")
#    user = User.new(email: Faker::Internet.email, password: "password", name: Faker::Name.name, pro: false)
#    user.photo.attach(io: file, filename: "sebsatien.png", content_type: "image/png")
#    user.save!
#    list_of_users << user
#  end
puts "  >> #{User.count} user(s) created"

puts "Creating projects..."
puts "  >> #{Project.count} project(s) created"

puts "Creating documents..."
puts "  >> #{Document.count} document(s) created"

puts "Creating tasks..."
i=0
20.times do
  task = Task.create(name: "Test#{i}",description: "Description of test#{i}",category: list_of_categories[rand(0..list_of_categories.count-1)],progress: rand(0..100),budget: rand(0..20000),start_at: Date.today-rand(0..90),end_at:Date.today+rand(0..90))
  list_of_tasks << task
  i += 1
end
puts "  >> #{Task.count} task(s) created"

puts "Creating reviews..."
puts "  >> #{Review.count} review(s) created"
puts "Finished!"
