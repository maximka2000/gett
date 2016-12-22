class CreateDrivers < ActiveRecord::Migration[5.0]
  def change
    create_table :drivers do |t|
      t.integer :driver_id
      t.string :name
      t.string :license_number

      t.timestamps
    end
  end
end
