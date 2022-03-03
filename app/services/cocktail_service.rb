class CocktailService

  def self.connection
    Faraday.new(url:'https://www.thecocktaildb.com/api/json/v2/9973533')
  end

  def self.search_random_cocktail
    response = connection.get('random.php')

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.internal_connection_cocktail
    Faraday.new(url: ENV['BACKEND_CONNECTION'])
  end

  def self.get_cocktail_data(id)
    response = connection.get("lookup.php?i=#{id}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.send_cocktail_vote(custom_params)
    response = internal_connection_cocktail.post('like') do |request|
      request.headers['Content-Type'] = 'application/json'
      request.body = JSON.generate(custom_params)
    end
  end
end
