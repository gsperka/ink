class Sketch < ActiveRecord::Base
  belongs_to :user
  belongs_to :tree, counter_cache: true
  belongs_to :parent, class_name: 'Sketch'
  has_many :children, class_name: 'Sketch', foreign_key: 'parent_id'

  def self.random_sketch
    sketch = Sketch.find(rand(self.count))
  end
end
