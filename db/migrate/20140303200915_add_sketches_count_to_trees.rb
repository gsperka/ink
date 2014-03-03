class AddSketchesCountToTrees < ActiveRecord::Migration
  def change
    add_column :trees, :sketches_count, :integer, deafult: 0
  end
end
