class Sketch < ActiveRecord::Base
  belongs_to :user
  belongs_to :tree
  belongs_to :parent, class_name: 'Sketch', foreign_key: 'sketch_id'
  has_many :children, class_name: 'Sketch'
end
