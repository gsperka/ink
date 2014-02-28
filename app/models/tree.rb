class Tree < ActiveRecord::Base
  has_many :sketches

  def self.by_vote

  end

  def random_sketch
    if self.sketches.count < 5
      self.sketches.last
    else
      self.sketches.last(5).sample
    end
  end

  def last_sketch
    self.sketches.last.json_data
  end
end
