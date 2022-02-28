class CocktailService

  def self.connection
    Faraday.new(url:'https://www.thecocktaildb.com/api/json/v2/9973533')
  end

  def self.search_random_cocktail
    response = connection.get('random.php')

    JSON.parse(response.body, symbolize_names: true)
  end
end
