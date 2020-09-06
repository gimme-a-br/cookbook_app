class Recipe < ApplicationRecord
  def ingredients_list
    ingredients.split(", ").map { |x| x.capitalize }
  end

  def directions_list
    directions.split(", ").map { |x| x.capitalize }
  end

  def friendly_created_at
    created_at.strftime("%B%e, %Y")
  end

  def friendly_prep_time
    result = ""
    hours = prep_time / 60
    minutes = prep_time % 60
    result += "#{hours} hours " if hours > 0
    result += "#{minutes} minutes" if minutes > 0
    result
  end
end
