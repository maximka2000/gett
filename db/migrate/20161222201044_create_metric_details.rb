class CreateMetricDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :metric_details do |t|
      t.string :metric_id
      t.string :value
      t.float :lon
      t.decimal :timestamp
      t.float :lat
      t.string :driver_id

      t.timestamps
    end
  end
end
