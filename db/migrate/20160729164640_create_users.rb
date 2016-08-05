class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
        t.integer :FB_userID, null: false
        t.string :first_name, null: false
        t.string :email
        t.integer :rating, default: 0

        t.timestamps null: false
    end
  end
end
