class CreateProperty < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.decimal :rent_per_month
      t.string :city
      t.text :district
      t.integer :beds_number
      t.string :name
      t.integer :types
      t.integer :user_id
      t.string  :mrt_line_station
      t.timestamps
    end
  end
end
