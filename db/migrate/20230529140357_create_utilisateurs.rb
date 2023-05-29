class CreateUtilisateurs < ActiveRecord::Migration[7.0]
  def change
    create_table :utilisateurs do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
