class RecipeService

  def self.connection
    Faraday.new(url:'https://www.themealdb.com/api/json/v2/9973533/')
  end

  def self.get_random_recipe
    response = connection.get('random.php')

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_five_recipes(region)
    response = connection.get("filter.php?a=#{region}")
    JSON.parse(response.body, symbolize_names: true)[:meals].sample(5)
  end
end
