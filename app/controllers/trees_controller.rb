class TreesController < ApplicationController
  def index 
    @popular = Tree.limit(5)
    @latest = Sketch.last(5)
  end

  def new
  end

  def create
    tree = Tree.create()
    sketch = Sketch.create(tree_id: tree.id, url: params[:sketch_json], user_id: current_user.id)

  end

  def show
    @tree = Tree.find(params[:id])
  end
end