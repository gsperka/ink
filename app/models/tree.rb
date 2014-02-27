class Tree < ActiveRecord::Base
  def self.by_vote

  end

  def self.random_sketch
    sketch = Sketch.where(tree_id: self.id).last(5).sample
    if sketch == nil
      self.random_sketch
    else
      sketch
    end
  end
end
