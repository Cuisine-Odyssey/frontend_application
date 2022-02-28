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

  def self.get_single_recipe_details(recipe_id)
    response = connection.get("lookup.php?i=#{recipe_id}")
    
    no_nulls = JSON.load(response, proc do |a|
      a.is_a?(Hash) && a.delete_if do |_k,v|
        next unless v.is_a?(String)
        v.empty?
      end
    end

    # binding.pry
    JSON.parse(no_nulls, symbolize_names: false)
  end
end
