class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :gear

  validates :date_de_debut, presence: true
  validates :date_de_fin, presence: true

  def cout_location
    (date_de_fin - date_de_debut) * gear.price
  end
end
