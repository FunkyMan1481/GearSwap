class AddPriceToGears < ActiveRecord::Migration[7.0]
  def change
    add_column :gears, :price, :float
  end
end
