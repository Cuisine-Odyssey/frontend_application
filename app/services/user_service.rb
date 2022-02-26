class UserService
  def self.connection
    Faraday.new(url: 'http://localhost:3000/api/v1/') do |faraday|
    end
  end

  def self.get_user(params)
    response = connection.post("users") do |request|
      request.headers['Content-Type'] = 'application/json'
      request.body = JSON.generate(user: params)
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_user_by_id(id)
    response = connection.get("users/#{id}") do |request|
      # request.params['api_key'] = ENV['backend_api_key']
    end

    JSON.parse(response.body, symbolize_names: true)
  end
end
