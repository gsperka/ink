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

  describe "#self.random" do
    sketch_z = Sketch.create(tree_id: 432, parent_id: 865, json_data: "empty for now")
    sketch_y = Sketch.create(tree_id: 754, parent_id: 976, json_data: "empty for now")
    sketch_x = Sketch.create(tree_id: 765, parent_id: 465, json_data: "empty for now")
    it "returns a random sketch that was created" do
      expect(Sketch.random).should_not eql(nil)
    end
  end

  describe "#self.latest" do  # Make sure tree_spec is not being run along with this test (multiple sketches will be created)
    sketch_w = Sketch.last
    sketch_v = Sketch.create(tree_id: 654, parent_id: 465, json_data: "empty for now")
    sketch_u = Sketch.last
    it "returns the last number of sketches and reverses their order" do
      expect(Sketch.latest(2)).to eql([sketch_u,sketch_w])
    end
  end

end
