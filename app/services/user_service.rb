class UserService 

  def self.connection
    Faraday.new(url:'') do |faraday|
      faraday.params['api_key'] = ENV['backend_api_key']
    end
  end

  def self.user(email)
  end
end
