class AddLocalisationToGears < ActiveRecord::Migration[7.0]
  def change
    add_column :gears, :localisation, :string
  end
end
