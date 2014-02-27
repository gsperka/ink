class CreateTrees < ActiveRecord::Migration
  def change
    create_table :trees do |t|
      t.integer :origin_id
      
      t.timestamps
    end
  end
end
