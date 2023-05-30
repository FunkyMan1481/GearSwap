Gear.destroy_all
require 'faker'

equipments_sportifs = [
  { name: "Ballon de football", description: "Ballon de football de taille standard" },
  { name: "Raquette de tennis", description: "Raquette avec cordage intact, manche en bon état et sans dommages structurels." },
  { name: "Casque de vélo", description: "Casque de protection spécialement conçu pour les cyclistes. Il offre une protection contre les chocs en cas de chute ou d'accident, tout en étant confortable à porter." },
  { name: "Chaussures de course", description: "Elles offrent un bon amorti, un soutien adéquat et une bonne adhérence pour permettre aux coureurs de performer de manière optimale." },
  { name: "Tapis de yoga", description: "Il offre une surface antidérapante et un bon amorti pour assurer confort et stabilité pendant les exercices." },
  { name: "Combinaison de plongée", description: "Tenue utilisée pour rester au chaud dans l'eau. Fabriquée à partir de néoprène" },
  { name: "Ballon de volleyball", description: "conçu pour avoir un bon rebond, une prise en main facile et une durabilité pour résister aux échanges rapides." },
  { name: "Ballon de rugby", description: "résistant et adapté aux conditions de jeu " },
  { name: "Planche à voile", description: "offrant une expérience de glisse unique." },
  { name: "Gants de boxe", description: "Ils offrent un bon rembourrage et un soutien pour minimiser les risques de blessures" },
  { name: "Planche de surf", description: "sans fissures ni dommages structurels, prête à être utilisée dans les vagues." },
  { name: "Sac de couchage", description: "Sac de couchage en bon état, propre et bien entretenu, offrant une isolation thermique adéquate pour une nuit confortable en camping" },
  { name: "Tente de camping", description: "Tente de camping en bon état, avec toutes les pièces intactes, prête à être utilisée pour une expérience de camping agréable et protégée." },
  { name: "Planche de skateboard", description: " Planche de skateboard en bon état, sans fissures ou déformations excessives, adaptée à la pratique du skateboard." },
  { name: "Lunettes de natation", description: "en bon état, avec des verres clairs, sans rayures, offrant une étanchéité adéquate pour une expérience de natation confortable." },
  { name: "Club de golf", description: "en bon état, avec une tête solide et un manche stable, prêt à être utilisé sur le parcours de golf." },
  { name: "Matelas gonflable", description: "en bon état, sans fuites d'air, offrant un soutien confortable pour le camping ou les activités de plein air" },
  { name: "Ballon de basketball", description: "bon état, bien gonflé, prêt à être utilisé pour jouer au basketball." },
  { name: "Paddle", description: "bon état, sans fissures ni dommages, adapté à la pratique du paddleboard sur l'eau. " },
  { name: "Vélo", description: "bon état, avec des freins fonctionnels, des pneus bien gonflés et une transmission fluide, prêt à être utilisé pour des promenades ou des balades" },
  { name: "Parasol", description: "bon état, avec une structure solide et un tissu résistant aux rayons UV" },
]

equipments_sportifs.each do |equipement|
  user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
  user.gears.create(name: equipement[:name], description: equipement[:description])
end
