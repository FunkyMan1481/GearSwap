class AddImageUrlToGears < ActiveRecord::Migration[7.0]
  def change
    add_column :gears, :image_url, :string
  end
end
