# app/services/recipe_service.rb

class RecipeService

  def self.external_connection
    Faraday.new(url: "https://www.themealdb.com/api/json/v2/#{ENV['EXTERNAL_API_KEY']}/")
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

  def self.internal_connection
    Faraday.new(url: ENV['BACKEND_CONNECTION'])
  end

  def self.send_recipe_vote(custom_params)
    response = internal_connection.post("recipes/#{custom_params[:vote]}") do |request|
      request.headers['Content-Type'] = 'application/json'
      request.body = JSON.generate(custom_params)
    end
    JSON.parse(response.body, symbolize_names: true)
  end

end
