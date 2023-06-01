require 'faker'
require "open-uri"

Gear.destroy_all
User.destroy_all

User.create!(
  email: "adam@gmail.com",
  password: "123456",
  first_name: "Adam",
  last_name: "Ollivier"
)
equipments_sportifs = [
  { name: "Ballon de football", description: "Ballon de football de taille standard", address: "95 rue des maraîchers, 75020 Paris", image_url: "https://www.clickforfoot.com/10998/ballon-officiel-ligue-1-football-match-t5.jpg" },
  { name: "Palmes", description: "Des palmes solides, faites pour la plongée", address: "45 Quai Adolphe Landry, 20260 Calvi", image_url: "https://globalneoprene.com/3253-home_default/palmes-plongee-reglables-cressi-thor-ebs-jaune.jpg" },
  { name: "Bouteille de plongée", description: "Une grande bouteille d'oxygène rempli, parfait pour la plongée", address: "Route de la plage, 20260 Calvi", image_url: "https://contents.mediadecathlon.com/p1543320/k$fd12a54a6890184051300bb13babed8e" },
  { name: "Masque de plongée", description: "Un masque de qualité, anti buée, parfait pour la plongée", address: "Punta Revellata, 20260 Calvi", image_url: "https://contents.mediadecathlon.com/p2075260/k$b263d76a81b041f83da4779abeb8f1ff/sq/250x250/Masques.jpg" },
  { name: "Tuba", description: "Tuba de plongée, idéal avec un masque pour la plongée", address: "Chemin Notre Dame de la Serra, 20260 Calvi", image_url: "https://contents.mediadecathlon.com/p1315189/k$00ee8c1e327eff7542b5c92422fdfbe1/sq/250x250/Tuba-plongee-500-Souple-Bleu.jpg" },
  { name: "Wingsuit", description: "Combinaison écureuil volant pour planer avec élégance", address: "6 Rue du Bastion de France, 20137 Porto-Vecchio", image_url: "https://img.aeroexpo.online/fr/images_ar/photo-g/172924-13226762.jpg" },
  { name: "Voile de Kitesurf", description: "Voile en parfait état, idéal pour vos virées maritime", address: "50-52 Rue Cardinal Fesch, 20000 Ajaccio", image_url: "https://contents.mediadecathlon.com/p2027760/k$2906fe3fe85c9dfb7dbc4eae445fdb68/sq/8766716.jpg?format=auto&f=800x0" },
  { name: "Raquette de tennis", description: "Raquette avec cordage intact, manche en bon état et sans dommages structurels.", address: "Rue 129EME, 76600 Le Havre", image_url: "https://www.cdiscount.com/pdt2/8/3/8/1/700x700/wil1828282721838/rw/wilson-raquette-de-tennis-unisexe-pour-les-joueur.jpg" },
  { name: "Casque de vélo", description: "Casque de protection spécialement conçu pour les cyclistes. Il offre une protection contre les chocs en cas de chute ou d'accident, tout en étant confortable à porter.", address: "Pl. Henri Barbusse, 62100 Calais", image_url: "https://www.cdiscount.com/pdt2/8/4/2/1/350x350/MP50994842/rw/casque-de-velo-casques-de-cyclisme-de-velo-moules.jpg"},
  { name: "Chaussures de course", description: "Elles offrent un bon amorti, un soutien adéquat et une bonne adhérence pour permettre aux coureurs de performer de manière optimale.", address: "13 Av. Danton, 08500 Revin", image_url: "https://media1.alltricks.fr/ckfinder/images/chaussure-running-21072016(1).jpg" },
  { name: "Tapis de yoga", description: "Il offre une surface antidérapante et un bon amorti pour assurer confort et stabilité pendant les exercices.", address: "Rue des Tilleuls, 57230 Bitche", image_url: "https://clicknco.fr/wp-content/uploads/2020/12/CORK-ACCESS_1.2.jpg" },
  { name: "Combinaison de plongée", description: "Tenue utilisée pour rester au chaud dans l'eau. Fabriquée à partir de néoprène", address: "*Rte de la Pinède, 20260 Calvi", image_url: "https://www.arimair.fr/images/Image/AQUALUNG-HYDROFLEX-3mm-combinaison-de-plongee-femme-SU77.jpg" },
  { name: "Finger Skate", description: "Pour faire du skate en toute sécurité", address: "Rue des Archers, 66000 Perpignan", image_url: "https://skateandannoy.com/wp-content/uploads/2009/07/fingerpants4.jpg" },
  { name: "Ballon de rugby", description: "résistant et adapté aux conditions de jeu ", address: "1 All. Gabriel Biénès, 31000 Toulouse", image_url: "https://www.enmoderugby.com/21431-medium_default/ballon-rugby-match-xv-france-gilbert.jpg" },
  { name: "Planche à voile", description: "offrant une expérience de glisse unique.", address: "Lac d, 1 Rue Jean Jaurès, 74000 Annecy", image_url: "https://windsurf.voyages-adekua.fr/sites/default/files/windsurf/produit/sejour-windsurf-a-piantarella-corse-avec-villa-7-personnes-location-materiel/images/vacances-windsurf-corse-trip-adekua-10.jpg" },
  { name: "Gants de boxe", description: "Ils offrent un bon rembourrage et un soutien pour minimiser les risques de blessures", address: "17 Rue de la Mertzau, 68100 Mulhouse", image_url: "https://euro.venum.com/media/catalog/product/cache/3d6373dfdbd8bf7042581a31874a0831/a/3/a3ef68a9d3ba7eaae456820230d7c512dc7b5861_BG_CONTENDER_KID_BLACK_RED_HD_01.jpg" },
  { name: "Planche de surf", description: "sans fissures ni dommages structurels, prête à être utilisée dans les vagues.", address: "40150 Soorts-Hossegor", image_url: "https://www.prism-surfboards.com/wp-content/uploads/2020/10/PRISM-softboard-76_full_1000x1000.jpg" },
  { name: "Sac de couchage", description: "Sac de couchage en bon état, propre et bien entretenu, offrant une isolation thermique adéquate pour une nuit confortable en camping", address: "Station de ski Les Espécières, 65120 Gavarnie-Gèdre", image_url: "https://media.istockphoto.com/id/469233068/fr/photo/femme-dans-un-sac-de-couchage-sur-la-montagne.jpg?s=612x612&w=0&k=20&c=uWqRYRPfiYovahRBNjjO7JINoFaZup_Cx-mLpBvWiQM=" },
  { name: "Tente de camping", description: "Tente de camping en bon état, avec toutes les pièces intactes, prête à être utilisée pour une expérience de camping agréable et protégée.", address: "Rue des Anciens d'Indochine, 46200 Souillac", image_url: "https://www.tentes-materiel-camping.com/39702-large_default/tente-pacific-reef-310-polycoton-4-places-safarica.jpg" },
  { name: "Planche de skateboard", description: " Planche de skateboard en bon état, sans fissures ou déformations excessives, adaptée à la pratique du skateboard.", address: "9 Rue de l'Ancienne Préfecture, 69002 Lyon", image_url: "https://www.cdiscount.com/pdt2/2/5/1/1/350x350/AUC2009783719251/rw/costway-skateboard-planche-a-roulettes-ovale-en-bo.jpg" },
  { name: "Lunettes de natation", description: "en bon état, avec des verres clairs, sans rayures, offrant une étanchéité adéquate pour une expérience de natation confortable.", address: "Av. Honoré de Balzac, 44500 La Baule-Escoublac", image_url: "https://fr.shopping.rakuten.com/photo/lunettes-de-natation-lunettes-de-natation-miroir-protection-complete-adultes-femmes-hommes-jeunes-lunettes-de-piscine-anti-buee-pas-de-fuite-noir-2415449142_ML.jpg" },
  { name: "Club de golf", description: "en bon état, avec une tête solide et un manche stable, prêt à être utilisé sur le parcours de golf.", address: "Pointe des Poulains, 56360 Sauzon", image_url: "https://www.shutterstock.com/image-photo/golf-club-bag-golfer-training-260nw-2024345636.jpg" },
  { name: "Matelas gonflable", description: "en bon état, sans fuites d'air, offrant un soutien confortable pour le camping ou les activités de plein air", address: "26 Rue Brissonnet, 10000 Troyes", image_url: "https://www.raviday-matelas.com/media/catalog/product/cache/16/image/700x/9df78eab33525d08d6e5fb8d27136e95/i/n/intex-64759-matelas-downy-2-places-xl-droite-min.jpg" },
  { name: "Ballon de basketball", description: "bon état, bien gonflé, prêt à être utilisé pour jouer au basketball.", address: "Pl. du Cardinal Luçon, 51100 Reims", image_url: "https://media.intersport.fr/is/image/intersportfr/00XB0700GR_FA?$produit_l$" },
  { name: "Paddle", description: "bon état, sans fissures ni dommages, adapté à la pratique du paddleboard sur l'eau. ", address: "Le Cotil, 61210 Putanges-le-Lac", image_url: "https://www.univers-du-pro.com/28221-large_default/paddle-gonflable-hydro-force-sup-bestway-avec-pagaie-aqua-journey-274-x-76-x-12-cm-accessoires.jpg" },
  { name: "Vélo", description: "bon état, avec des freins fonctionnels, des pneus bien gonflés et une transmission fluide, prêt à être utilisé pour des promenades ou des balades", address: "46 Rue Noël Lerrant, 29530 Plonévez-du-Faou", image_url: "https://saligon.com/wp-content/uploads/2023/01/Velo-OSHILON-Taille-26-Noir-vert-1-large.jpg" },
  { name: "Parasol", description: "bon état, avec une structure solide et un tissu résistant aux rayons UV", address: "11 Rue des Chasseurs, 34070 Montpellier", image_url: "https://macollectionricard.files.wordpress.com/2013/05/bb17d-2652582817-2.jpg" },
]

equipments_sportifs.each do |equipement|
  user = User.create!(email: Faker::Internet.email, password: "123456", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
  gear = user.gears.create!(name: equipement[:name], description: equipement[:description], address: equipement[:address], price: (10..100).to_a.sample)
  file = URI.open(equipement[:image_url])
  gear.photo.attach(io: file, filename: "#{equipement[:name]}.jpg", content_type: "image/jpg")
end
