require 'sinatra'
require 'crack'
require 'uri'
require 'net/http'
require 'api-auth'

get '/projects' do
  base_url = "https://vipul.mingle.thoughtworks.com"
  project_url = '/api/v2/projects.xml'

  mingle_projects = {}
  mingle_pages = {}

  response = get_response(base_url + project_url)
  puts "[DEBUG] response => #{response.inspect}"
  
  response_body = Crack::XML.parse(response.body)["projects"]
  response_body.each {|a| mingle_projects.merge!  a["identifier"] => a["name"] }
  
  @radiators = mingle_projects
  erb :index, :locals => {:radiators => @radiators}
end

get "/show" do
  project_id = params.permit(:id)[:id]
  base_url = "https://vipul.mingle.thoughtworks.com"
  pages_url = "/api/v2/projects/#{project_id}/wiki.xml"
  response = get_response(base_url + pages_url)
  response_body = Crack::XML.parse(response.body)["pages"]
  @pages = response_body.collect {|a| {:identifier => a["identifier"], :name => a["name"] } }
  render :json => @pages
end



def get_response(url)
  
  access_key_id = "vgarg"
  secret_access_key = "sbscJW7kEz57rxFLuMTxZaJdT3PO3z9K7VOXSt+dFz8="
  
  
  uri = URI.parse(url)
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true

  request = Net::HTTP::Get.new(uri.request_uri)
  ApiAuth.sign!(request, access_key_id, secret_access_key)

  http.request(request)  
end

get '/' do
  'Hello world!'
end