class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.references :creator, null: false, index: true
      t.string :first_name, null: false
      t.string :title, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.integer :pizzas, default: 1
      t.string :status, default: "open"
      t.integer :donor_id

      t.timestamps null: false
    end
  end
end
