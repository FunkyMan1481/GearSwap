class Gear < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  attribute :image_url, :string
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_name_and_description,
  against: [ :name, :description ],
  using: {
    tsearch: { prefix: true }
  }
end
