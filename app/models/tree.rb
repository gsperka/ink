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

  def all_sketches_json
    self.sketches.map do |sketch|
      {sketch.id => sketch.json_data}
    end.to_json
  end

  def all_sketches_lineage
    self.sketches.map do |sketch|
      {id: sketch.lineage}
    end.to_json
  end

end
