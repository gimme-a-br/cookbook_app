class Api::RecipesController < ApplicationController
  def one_recipe_action
    @recipe = Recipe.first
    render "one_recipe.json.jb"
  end

  def all_recipes_action
    @all_recipes = Recipe.all
    render "all_recipes.json.jb"
  end
end
