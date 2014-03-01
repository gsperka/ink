class SketchesController < ApplicationController

  def new
    @tree = Tree.find(params[:tree_id])
  end

  def create
    @tree = Tree.find(params[:tree_id])
    sketch = Sketch.create(tree_id: @tree.id, parent_id: params[:parent_id], json_data: params[:sketch_json], user_id: current_user.id)
    if Sketch.find(sketch.parent_id).tree_data == nil
      sketch.tree_data = sketch.id.to_s
    else
      sketch.tree_data = Sketch.find(sketch.parent_id).tree_data.to_s + "," + sketch.id.to_s
    end
    sketch.save
    redirect_to tree_path(@tree.id)
  end

  def show
    @tree = Tree.find(params[:tree_id])
    @sketch = Sketch.find(params[:id])
  end
end
