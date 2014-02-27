class CreateSketches < ActiveRecord::Migration
  def change
    create_table :sketches do |t|
      t.belongs_to :user
      t.belongs_to :tree
      t.text :url

      t.timestamps
    end
  end
end
