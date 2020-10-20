class Api::RecipesController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def index
    @recipes = Recipe.all

    if params[:search_terms]
      @recipes = @recipes.where("title ILIKE ?", "%#{params[:search_terms]}%")
    end

    @recipes = @recipes.order(:id => :asc)

    render "index.json.jb"
  end

  def create
    if params[:image]
      response = Cloudinary::Uploader.upload(params[:image])
      image_url = response["secure_url"]
    else
      image_url = params[:image_url]
    end
    @recipe = Recipe.new(
      user_id: current_user.id,
      title: params[:title],
      chef: params[:chef],
      ingredients: params[:ingredients],
      directions: params[:directions],
      image_url: image_url,
      prep_time: params[:prep_time],
    )
    if @recipe.save
      render "show.json.jb"
    else
      render json: { errors: @recipe.errors.full_messages }
    end
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
    render "show.json.jb"
  end

  def update
    @recipe = Recipe.find_by(id: params[:id])

    @recipe.title = params[:title] || @recipe.title
    @recipe.chef = params[:chef] || @recipe.chef
    @recipe.ingredients = params[:ingredients] || @recipe.ingredients
    @recipe.directions = params[:directions] || @recipe.directions
    @recipe.image_url = params[:image_url] || @recipe.image_url
    @recipe.prep_time = params[:prep_time] || @recipe.prep_time
    @recipe.save

    render "show.json.jb"
  end

  def destroy
    recipe = Recipe.find_by(id: params[:id])
    recipe.destroy
    render json: { message: "Recipe destroyed successfully!" }
  end
end
