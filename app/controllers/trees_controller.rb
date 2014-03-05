class TreesController < ApplicationController
  def index
    @popular = Tree.by_sketch_count(30)
    @latest = Sketch.all.last(5)
  end

  def new
  end

  def create
    tree = Tree.create()
    if current_user
      sketch = Sketch.create(tree_id: tree.id, json_data: params[:sketch_json], user_id: current_user.id)
      tree.update(origin_id: sketch.id)

      respond_to do |format|
        format.json { render :json => {path: tree_sketch_path(tree, sketch)} }
      end
    else
      sketch = Sketch.create(tree_id: tree.id, json_data: params[:sketch_json], user_id: 1)
      tree.update(origin_id: sketch.id)
      session[:new_user_sketch_id] = sketch.id
      respond_to do |format|
        format.json { render :json => {path: login_path} }
      end
    end
  end

  def show
    @tree = Tree.find(params[:id])
    @origin = @tree.origin_id
    @sketches = @tree.sketches
  end
end
