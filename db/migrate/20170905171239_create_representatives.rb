class CreateRepresentatives < ActiveRecord::Migration[5.1]
  def change
    create_table :representatives do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :office, null: false
      t.string :email
      t.string :party
      t.text :bio, null: false
      t.date :elected, null: false
      t.string :phone_number, null: false
      t.string :picture_url, null: false

      t.timestamps
    end
  end
end
