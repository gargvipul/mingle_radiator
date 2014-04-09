module Utils
  
  def get_response(url)
    
    access_key_id = "test_user"
    secret_access_key = "po4eDFWw/PjNwImfmK6dBhxIzaYqLnCwecAAiGRRjDY="
    
    
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(uri.request_uri)
    ApiAuth.sign!(request, access_key_id, secret_access_key)

    http.request(request)  
  end
  
end