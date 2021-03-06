class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :bio
      t.string :phone_number
      t.string :email
      t.integer :user_id

      t.timestamps
    end
  end
end
