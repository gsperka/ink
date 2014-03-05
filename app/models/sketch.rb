class Sketch < ActiveRecord::Base
  belongs_to :user
  belongs_to :tree, counter_cache: true
  belongs_to :parent, class_name: 'Sketch'
  has_many :children, class_name: 'Sketch', foreign_key: 'parent_id'

  def self.random
    self.all.sample
  end

  def self.latest(num)
    self.all.last(num).reverse
  end

  def as_tree
    node_hash = {}
    node_hash[:id] = self.id
    node_hash[:children] = self.children.map(&:as_tree) unless self.children.empty?
    return node_hash
  end
end
