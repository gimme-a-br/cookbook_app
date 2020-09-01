Rails.application.routes.draw do
  namespace :api do
    get "/one_recipe_path" => "recipes#one_recipe_action"
  end
end
