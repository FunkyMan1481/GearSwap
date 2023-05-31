class Gear < ApplicationRecord
  has_many :reservations, dependent: :destroy
  attribute :image_url, :string
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
