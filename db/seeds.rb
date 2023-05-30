require 'faker'

Gear.destroy_all
User.destroy_all

equipments_sportifs = [
  { name: "Ballon de football", description: "Ballon de football de taille standard", image_url: "https://www.clickforfoot.com/10998/ballon-officiel-ligue-1-football-match-t5.jpg" },
  { name: "Raquette de tennis", description: "Raquette avec cordage intact, manche en bon état et sans dommages structurels.", image_url: "https://www.cdiscount.com/pdt2/8/3/8/1/700x700/wil1828282721838/rw/wilson-raquette-de-tennis-unisexe-pour-les-joueur.jpg" },
  { name: "Casque de vélo", description: "Casque de protection spécialement conçu pour les cyclistes. Il offre une protection contre les chocs en cas de chute ou d'accident, tout en étant confortable à porter.", image_url: "https://www.cdiscount.com/pdt2/8/4/2/1/350x350/MP50994842/rw/casque-de-velo-casques-de-cyclisme-de-velo-moules.jpg"},
  { name: "Chaussures de course", description: "Elles offrent un bon amorti, un soutien adéquat et une bonne adhérence pour permettre aux coureurs de performer de manière optimale.", image_url: "https://media1.alltricks.fr/ckfinder/images/chaussure-running-21072016(1).jpg" },
  { name: "Tapis de yoga", description: "Il offre une surface antidérapante et un bon amorti pour assurer confort et stabilité pendant les exercices.", image_url: "https://clicknco.fr/wp-content/uploads/2020/12/CORK-ACCESS_1.2.jpg" },
  { name: "Combinaison de plongée", description: "Tenue utilisée pour rester au chaud dans l'eau. Fabriquée à partir de néoprène", image_url: "https://www.arimair.fr/images/Image/AQUALUNG-HYDROFLEX-3mm-combinaison-de-plongee-femme-SU77.jpg" },
  { name: "Finger Skate", description: "Pour faire du skate en toute sécurité", image_url: "https://skateandannoy.com/wp-content/uploads/2009/07/fingerpants4.jpg" },
  { name: "Ballon de rugby", description: "résistant et adapté aux conditions de jeu ", image_url: "https://www.enmoderugby.com/21431-medium_default/ballon-rugby-match-xv-france-gilbert.jpg" },
  { name: "Planche à voile", description: "offrant une expérience de glisse unique.", image_url: "https://windsurf.voyages-adekua.fr/sites/default/files/windsurf/produit/sejour-windsurf-a-piantarella-corse-avec-villa-7-personnes-location-materiel/images/vacances-windsurf-corse-trip-adekua-10.jpg" },
  { name: "Gants de boxe", description: "Ils offrent un bon rembourrage et un soutien pour minimiser les risques de blessures", image_url: "https://euro.venum.com/media/catalog/product/cache/3d6373dfdbd8bf7042581a31874a0831/a/3/a3ef68a9d3ba7eaae456820230d7c512dc7b5861_BG_CONTENDER_KID_BLACK_RED_HD_01.jpg" },
  { name: "Planche de surf", description: "sans fissures ni dommages structurels, prête à être utilisée dans les vagues.", image_url: "https://www.prism-surfboards.com/wp-content/uploads/2020/10/PRISM-softboard-76_full_1000x1000.jpg" },
  { name: "Sac de couchage", description: "Sac de couchage en bon état, propre et bien entretenu, offrant une isolation thermique adéquate pour une nuit confortable en camping", image_url: "https://media.istockphoto.com/id/469233068/fr/photo/femme-dans-un-sac-de-couchage-sur-la-montagne.jpg?s=612x612&w=0&k=20&c=uWqRYRPfiYovahRBNjjO7JINoFaZup_Cx-mLpBvWiQM=" },
  { name: "Tente de camping", description: "Tente de camping en bon état, avec toutes les pièces intactes, prête à être utilisée pour une expérience de camping agréable et protégée.", image_url: "https://www.tentes-materiel-camping.com/39702-large_default/tente-pacific-reef-310-polycoton-4-places-safarica.jpg" },
  { name: "Planche de skateboard", description: " Planche de skateboard en bon état, sans fissures ou déformations excessives, adaptée à la pratique du skateboard.", image_url: "https://www.cdiscount.com/pdt2/2/5/1/1/350x350/AUC2009783719251/rw/costway-skateboard-planche-a-roulettes-ovale-en-bo.jpg" },
  { name: "Lunettes de natation", description: "en bon état, avec des verres clairs, sans rayures, offrant une étanchéité adéquate pour une expérience de natation confortable.", image_url: "https://fr.shopping.rakuten.com/photo/lunettes-de-natation-lunettes-de-natation-miroir-protection-complete-adultes-femmes-hommes-jeunes-lunettes-de-piscine-anti-buee-pas-de-fuite-noir-2415449142_ML.jpg" },
  { name: "Club de golf", description: "en bon état, avec une tête solide et un manche stable, prêt à être utilisé sur le parcours de golf.", image_url: "https://www.shutterstock.com/image-photo/golf-club-bag-golfer-training-260nw-2024345636.jpg" },
  { name: "Matelas gonflable", description: "en bon état, sans fuites d'air, offrant un soutien confortable pour le camping ou les activités de plein air", image_url: "https://www.raviday-matelas.com/media/catalog/product/cache/16/image/700x/9df78eab33525d08d6e5fb8d27136e95/i/n/intex-64759-matelas-downy-2-places-xl-droite-min.jpg" },
  { name: "Ballon de basketball", description: "bon état, bien gonflé, prêt à être utilisé pour jouer au basketball.", image_url: "https://media.intersport.fr/is/image/intersportfr/00XB0700GR_FA?$produit_l$" },
  { name: "Paddle", description: "bon état, sans fissures ni dommages, adapté à la pratique du paddleboard sur l'eau. ", image_url: "https://www.univers-du-pro.com/28221-large_default/paddle-gonflable-hydro-force-sup-bestway-avec-pagaie-aqua-journey-274-x-76-x-12-cm-accessoires.jpg" },
  { name: "Vélo", description: "bon état, avec des freins fonctionnels, des pneus bien gonflés et une transmission fluide, prêt à être utilisé pour des promenades ou des balades", image_url: "https://saligon.com/wp-content/uploads/2023/01/Velo-OSHILON-Taille-26-Noir-vert-1-large.jpg" },
  { name: "Parasol", description: "bon état, avec une structure solide et un tissu résistant aux rayons UV", image_url: "https://macollectionricard.files.wordpress.com/2013/05/bb17d-2652582817-2.jpg" },
]

equipments_sportifs.each do |equipement|
  user = User.create!(email: Faker::Internet.email, password: "123456", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
  user.gears.create!(name: equipement[:name], description: equipement[:description], image_url: equipement[:image_url])
end
