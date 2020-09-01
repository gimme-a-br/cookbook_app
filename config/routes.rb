Rails.application.routes.draw do
  namespace :api do
    get "/one_recipe_path" => "recipes#one_recipe_action"
    get "/all_recipes_path" => "recipes#all_recipes_action"
  end
end
