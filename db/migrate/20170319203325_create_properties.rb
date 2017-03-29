class CreateProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :properties do |t|
      t.text :description
      t.text :key_features
      t.attachment :floor_plan
      t.text :address
      t.float :latitude
      t.float :longitude
      t.integer :user_id
      t.timestamps
    end
  end
end
