class CreateFavorite < ActiveRecord::Migration[7.0]
  def change
    create_table :favorites do |t|
      t.integer :user_id, null: false
      t.integer :property_id, null: false
      t.timestamps
    end
  end
end
