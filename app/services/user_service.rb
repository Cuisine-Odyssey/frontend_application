class UserService

  def self.connection
    Faraday.new(url: ENV['BACKEND_CONNECTION']) do |faraday|
    end
  end

  def self.get_user_by_email(email)
    response = connection.get('users') do |request|
      request.params['email'] = email
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.create_or_update_user(params)
    response = connection.post("users") do |request|
      request.headers['Content-Type'] = 'application/json'
      request.body = JSON.generate(user: params)
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  # def self.get_user_by_id(id)
  #   response = connection.get("users/#{id}")
  #   JSON.parse(response.body, symbolize_names: true)
  # end

end
