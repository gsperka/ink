require 'spec_helper'

describe Sketch do

  describe "#new" do
    sketch_one = Sketch.create(tree_id: 1, parent_id: 1, json_data: "empty for now")
    it "finds the tree_id of the sketch" do
      expect(sketch_one.tree_id).to eql(1)
    end
  end

  describe "#create" do
    sketch_one = Sketch.create(tree_id: 1, parent_id: 1, json_data: "empty for now")
    it "creates a sketch and assigns the proper tree_id" do
      expect(sketch_one).to be_valid
    end
  end

end
