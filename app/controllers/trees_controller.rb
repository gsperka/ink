class TreesController < ApplicationController
  def index
    @popular = Tree.all.limit(20)
    @latest = Sketch.all.last(5)
  end

  def new
  end

  def create
    tree = Tree.create()
    sketch = Sketch.create(tree_id: tree.id, url: params[:sketch_json], user_id: current_user.id)
    tree.origin_id = sketch.id
    tree.save
    
    respond_to do |format|
      format.json do
        render tree.id.to_json
      end
    end
  end

  def show
    @tree = Tree.find(params[:id])
  end
end
