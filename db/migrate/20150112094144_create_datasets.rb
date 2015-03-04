class CreateDatasets < ActiveRecord::Migration
  def change
    create_table :datasets do |t|
      t.string :dataset_name
      t.text :description
      t.references :user, index: true
 
      t.timestamps
    end
    add_attachment :datasets, :file
  end
end
