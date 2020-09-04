class Api::RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    render "index.json.jb"
  end

  def show
    @recipe = Recipe.first
    render "show.json.jb"
  end
end
