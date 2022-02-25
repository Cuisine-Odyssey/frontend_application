class RecipeService

  def self.connection
    Faraday.new(url:'https://www.themealdb.com/api/json/v1/1/')
  end

  def self.get_random_recipe
    response = connection.get('random.php')

    JSON.parse(response.body, symbolize_names: true)
  end
end
