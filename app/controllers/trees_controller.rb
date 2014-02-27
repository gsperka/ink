class TreesController < ApplicationController
  def index 
    @popular = Tree.limit(5)
    @latest = Sketch.last(5)
  end

  def show
    @tree = Tree.find(params[:id])
  end
end