class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.text :data
      t.references :dataset, index: true

      t.timestamps null: false
    end
    add_foreign_key :records, :datasets
  end
end
