module Utils
  
  def get_response(url)
    
    access_key_id = "vgarg"
    secret_access_key = "Cs3J5wDLR699Tp7NJTuuVkxP4DyHaZqPB0YlWo9rM5I="
    
    
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(uri.request_uri)
    ApiAuth.sign!(request, access_key_id, secret_access_key)

    http.request(request)  
  end
  
end