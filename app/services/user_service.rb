class UserService
<<<<<<< HEAD

=======
>>>>>>> deb68be2ae2bb8fa27c487e392d1068e3153ff63
  def self.connection
    Faraday.new(url: 'http://localhost:3000/api/v1/') do |faraday|
    end
  end

<<<<<<< HEAD
  def self.get_user_by_email(email)
    response = connection.get("users?email=#{email}") do |request|
      # request.params['api_key'] = ENV['backend_api_key']
=======
  def self.get_user(params)
    response = connection.post("users") do |request|
      request.headers['Content-Type'] = 'application/json'
      request.body = JSON.generate(user: params)
>>>>>>> deb68be2ae2bb8fa27c487e392d1068e3153ff63
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_user_by_id(id)
    response = connection.get("users/#{id}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
