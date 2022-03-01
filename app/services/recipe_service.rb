# app/services/recipe_service.rb
class RecipeService
  # external api calls to TheMealDB

  def self.external_connection
    Faraday.new(url: 'https://www.themealdb.com/api/json/v2/9973533/')
  end

  def self.get_random_recipe
    response = external_connection.get('random.php')

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_five_recipes(region)
    response = external_connection.get("filter.php?a=#{region}")
    JSON.parse(response.body, symbolize_names: true)[:meals].sample(5)
  end

  def self.get_single_recipe_details(recipe_id)
    response = external_connection.get("lookup.php?i=#{recipe_id}")
    JSON.parse(response.body, symbolize_names: true)
  end

  # internal api calls - likes and dislikes
  def self.internal_connection
    Faraday.new(url: 'http://localhost:3000/api/v1/recipes/')
  end

  def self.add_recipe_like(custom_params)
    response = internal_connection.post('like') do |request|
      request.headers['Content-Type'] = 'application/json'
      request.body = JSON.generate(custom_params)
    end
  end
  
end
