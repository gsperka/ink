require 'spec_helper'

  describe Tree do

    describe "#self.by_sketch_count(limit)" do
      tree_one = Tree.create(id: 1, origin_id: 2, created_at: "2014-03-02 21:15:05")
      tree_two = Tree.create(id: 2, origin_id: 3, created_at: "2014-04-02 21:15:05")
      tree_three = Tree.create(id: 3, origin_id: 4, created_at: "2014-05-02 21:15:05")
      it "arranges the accending order of trees displayed" do
        expect(Tree.by_sketch_count(3)[0]).to eql(tree_one)
        end
      end

    describe "#random_sketch" do
      sketch_one = Sketch.create(tree_id: 10, parent_id: 11, json_data: "empty for now")
      sketch_two = Sketch.create(tree_id: 12, parent_id: 12, json_data: "empty for now")
      sketch_three = Sketch.create(tree_id: 13, parent_id: 13, json_data: "empty for now")
      sketch_four = Sketch.create(tree_id: 14, parent_id: 14, json_data: "empty for now")
      sketches_all = [sketch_one,sketch_two,sketch_three,sketch_four]
      tree_four = Tree.create(id: 41, sketches: sketches_all)
      last_sketch = tree_four.sketches.last
      it "returns the last sketch if count is less than 5" do
        expect(tree_four.random_sketch).to eql(last_sketch)
      end


      sketch_five = Sketch.create(tree_id: 101, parent_id: 111, json_data: "empty for now")
      sketch_six = Sketch.create(tree_id: 121, parent_id: 121, json_data: "empty for now")
      sketch_seven = Sketch.create(tree_id: 131, parent_id: 131, json_data: "empty for now")
      sketch_eight = Sketch.create(tree_id: 141, parent_id: 141, json_data: "empty for now")
      sketch_nine = Sketch.create(tree_id: 131, parent_id: 131, json_data: "empty for now")
      sketch_ten = Sketch.create(tree_id: 141, parent_id: 141, json_data: "empty for now")
      sketches_all_two = [sketch_five,sketch_six,sketch_seven,sketch_eight,sketch_nine,sketch_ten]
      tree_five = Tree.create(id: 51, sketches: sketches_all_two)
      sketch_sample = tree_five.sketches.last(5).sample
      it "returns a random sketch of the tree if the sketch count is 5 or greater" do
        expect(tree_five.random_sketch).should_not eql(sketch_five)
      end
    end

    describe "#last_sketch" do
      sketch_eleven = Sketch.create(tree_id: 102, parent_id: 112, json_data: "not empty")
      sketch_twelve = Sketch.create(tree_id: 103, parent_id: 113, json_data: "empty for now")
      sketches_all_three = [sketch_eleven, sketch_twelve]
      tree_six = Tree.create(id: 200, sketches: sketches_all_three)
      it "returns the json_data of the last sketch" do
        expect(tree_six.last_sketch).to eql("empty for now")
      end
    end

    describe "#all_sketches_json" do
      sketch_a = Sketch.create(id: 1555, tree_id: 200, parent_id: 210, json_data: "not empty")
      sketch_b = Sketch.create(id: 1655, tree_id: 201, parent_id: 211, json_data: "empty for now")
      sketch_c = Sketch.create(id: 1755, tree_id: 202, parent_id: 212, json_data: "1234567890")
      sketches_all_four = [sketch_a, sketch_b, sketch_c]
      tree_seven = Tree.create(id: 220, sketches: sketches_all_four)
      it "returns the json_data for all sketches and assigns sketch_id to it's json_data" do
        expect(tree_seven.all_sketches_json).to eql('[{"1555":"not empty"},{"1655":"empty for now"},{"1755":"1234567890"}]')
      end
    end

    describe "#all_sketches_lineage" do
      sketch_d = Sketch.create(id: 2555, tree_id: 2002, parent_id: 2102, json_data: "not empty", lineage: "1,5,7" )
      sketch_e = Sketch.create(id: 2655, tree_id: 2012, parent_id: 2121, json_data: "empty for now", lineage: "2,9,12")
      sketch_f = Sketch.create(id: 2755, tree_id: 2022, parent_id: 2122, json_data: "1234567890", lineage: "5,8,20")
      sketches_all_five = [sketch_d, sketch_e, sketch_f]
      tree_eight = Tree.create(id: 300, sketches: sketches_all_five)
      it "assigns the lineage of the sketches as the sketches' id" do
        expect(tree_eight.all_sketches_lineage).to eql('[{"id":"1,5,7"},{"id":"2,9,12"},{"id":"5,8,20"}]')
      end
    end

  end
