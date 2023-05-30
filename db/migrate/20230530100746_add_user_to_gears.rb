class AddUserToGears < ActiveRecord::Migration[7.0]
  def change
    add_reference :gears, :user, foreign_key: true
  end
end
