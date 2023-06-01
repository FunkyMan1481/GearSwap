class AddAvatarToGears < ActiveRecord::Migration[7.0]
  def change
    add_column :gears, :avatar, :string
  end
end
