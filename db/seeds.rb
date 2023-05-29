# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb
# db/seeds.rb

# ...

# Liste d'équipements sportifs possibles
equipment_names = [
  'Ballon de football', 'Raquette de tennis', 'Casque de vélo', 'Chaussures de course',
  'Tapis de yoga', 'Gants de boxe', 'Poids pour haltères', 'Barre de traction',
  'Ballon de basketball', 'Bâton de hockey', 'Patin à glace', 'Planche de surf',
  'Raquette de badminton', 'Ballon de volleyball', 'Gants de gardien de but', 'Maillot de cyclisme',
  'Planche à voile', 'Combinaison de plongée', 'Gilet de sauvetage', 'Corde à sauter',
  'Sac de frappe', 'Bande de résistance', 'Ballon de rugby', 'Raquette de ping-pong',
  'Balle de golf', 'Club de golf', 'Tee de golf', 'Crampons de football',
  'Protège-tibias', 'Casque de football', 'Masque de ski', 'Bâtons de ski',
  'Chaussures de randonnée', 'Boussole', 'Sac à dos de randonnée', 'Tente de camping',
  'Sac de couchage', 'Matelas gonflable', 'Lampe de poche', 'Gourde',
  'Bâton de marche', 'Chaussures d’escalade', 'Harnais d’escalade', 'Corde d’escalade',
  'Mousqueton', 'Descendeur', 'Magnésie', 'Casque d’escalade',
  'Planche de skateboard', 'Roues de skateboard', 'Trucks de skateboard', 'Grip de skateboard',
  'Ballon de handball', 'Maillot de bain', 'Lunettes de natation', 'Bonnet de natation'
]

# Création des équipements sportifs
equipment_names.each do |name|
  equipment = {
    name: name,
    category: 'Sport',
    description: "#{name} de qualité supérieure",
    available: [true, false].sample, # Disponibilité aléatoire
    price: rand(10.0..100.0).round(2), # Prix aléatoire
  }
  Equipement.create!(equipment)
end
