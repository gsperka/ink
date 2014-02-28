class SketchesController < ApplicationController

  def new
    @tree = Tree.find(params[:tree_id])
  end

  def create
    sketch = Sketch.create(tree_id: 2, url: params[:sketch_json], user_id: current_user.id)
  end

  def show
    @tree = Tree.find(params[:tree_id])
    @sketch = Sketch.find(params[:id])
  end
end
