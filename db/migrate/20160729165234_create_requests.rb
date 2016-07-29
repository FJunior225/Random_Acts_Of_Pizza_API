class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.references :creator, null: false, index: true
      t.string :title, null: false
      t.string :video, null: false
      t.integer :pizzas, default: 1
      t.string :status, default: "open"
      t.references :donor, index: true

      t.timestamps null: false
    end
  end
end
