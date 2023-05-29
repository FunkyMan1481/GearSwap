class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.date :date_de_debut
      t.date :date_de_fin

      t.timestamps
    end
  end
end
