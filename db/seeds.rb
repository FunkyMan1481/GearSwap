# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb

equipment_names = ['Ballon de football', 'Raquette de tennis', 'Maillot de bain', 'Casque de vélo', 'Chaussures de course',
  'Sac de golf', 'Tapis de yoga', 'Gants de boxe', 'Balle de baseball', 'Pagaie de kayak', 'Chaussures de randonnée',
  'Planche de surf', 'Ski', 'Batte de cricket', 'Frisbee', 'Masque de plongée', 'Balle de rugby', 'Baskets',
  'Dumbbells', 'Corde à sauter', 'Ballon de basketball', 'Haltères', 'Bandes de résistance', 'Tapis de course',
  'Ballon de volley', 'Equipement d\'escalade', 'Raquette de badminton', 'Bottes de ski', 'Casque de ski',
  'Poids de cheville', 'Barre de traction', 'Gants de gardien', 'Planche à voile', 'Chaussures de danse',
  'Équipement d\'équitation', 'Raquette de squash', 'Table de ping pong', 'Ballon de handball', 'Bâtons de randonnée',
  'Gants de cyclisme', 'Équipement de plongée', 'Ballon de foot US', 'Arc de tir à l'arc', 'Balle de squash',
  'Équipement de pêche', 'Équipement de gymnastique', 'Raquette de paddle', 'Kettlebell', 'Bâton de hockey',
  'Équipement de ski de fond', 'Équipement de water polo']

categories = ['Football', 'Tennis', 'Natation', 'Cyclisme', 'Athlétisme', 'Golf', 'Yoga', 'Boxe', 'Baseball', 'Kayak',
'Randonnée', 'Surf', 'Ski', 'Cricket', 'Frisbee', 'Plongée', 'Rugby', 'Basketball', 'Gym', 'Volleyball',
'Escalade', 'Badminton', 'Course', 'Handball', 'Cyclisme', 'Danse', 'Équitation', 'Squash', 'Ping pong',
'Randonnée', 'Foot US', 'Tir à l\'arc', 'Pêche', 'Gymnastique', 'Paddle', 'Hockey', 'Ski de fond', 'Water polo']

50.times do
Equipment.create!(
name: equipment_names.sample,
category: categories.sample,
price: rand(10.0..100.0).round(2),
quantity: rand(1..20)
)
end
