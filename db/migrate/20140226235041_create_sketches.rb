class CreateSketches < ActiveRecord::Migration
  def change
    create_table :sketches do |t|
      t.belongs_to :user
      t.belongs_to :tree
      t.text :json_data
      t.text :lineage
      t.string :parent_id
      t.timestamps
    end
  end
end
