class SketchesController < ApplicationController
  
  def new
    @sketch = Sketch.new
  end

  def create
    
  end

  def show
    @tree = Tree.find(params[:tree_id])
    @sketch = Sketch.find(params[:id])
  end
end