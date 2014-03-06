class SketchesController < ApplicationController

  def new
    @tree = Tree.find(params[:tree_id])
  end

  def create
    @tree = Tree.find(params[:tree_id])
    sketch = Sketch.create(tree_id: @tree.id, parent_id: params[:parent_id], json_data: params[:sketch_json])

    if current_user
      sketch.update(user_id: current_user.id)
      correct_redirect = tree_sketch_path(@tree, sketch)
    else
      sketch.update(user_id: 1)
      correct_redirect = login_path
      session[:new_user_sketch_id] = sketch.id
    end

    if sketch.parent.lineage == nil
      sketch.lineage = sketch.id.to_s
    else
      sketch.lineage = sketch.parent.lineage.to_s + "," + sketch.id.to_s
    end
    sketch.save
    respond_to do |format|
      format.json { render :json => {path: correct_redirect } }
    end
  end

  def show
    @tree = Tree.find(params[:tree_id])
    @sketch = Sketch.find(params[:id])
  end

  def random
    sketch = Sketch.random
    tree = sketch.tree
    respond_to do |format|
      format.json { render :json => {path: tree_sketch_path(tree, sketch) } }
    end
  end
end
