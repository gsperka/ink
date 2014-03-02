class TreesController < ApplicationController
  def index
    @popular = Tree.all.limit(20)
    @latest = Sketch.all.last(5)
  end

  def new
  end

  def create
    tree = Tree.create()
    if current_user != nil
      sketch = Sketch.create(tree_id: tree.id, json_data: params[:sketch_json], user_id: current_user.id)
      sketch.save
      tree.origin_id = sketch.id
      tree.save

      respond_to do |format|
      format.json { render :json => tree.id }
       end
    elsif current_google_user != nil
      google_sketch =  Sketch.create(tree_id: tree.id, json_data: params[:sketch_json], user_id: current_google_user.id)
      google_sketch.save
      tree.origin_id = google_sketch.id
      tree.save

      respond_to do |format|
      format.json { render :json => tree.id }
      end
    end
  end

  def show
    @tree = Tree.find(params[:id])
    @origin = @tree.origin_id
    @sketches = @tree.sketches
  end
end
