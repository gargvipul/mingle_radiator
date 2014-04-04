require 'net/https'
require 'crack/xml'  
require 'api_auth'
require './utils'
  
include Crack
include Utils

base_url = "https://mingle.mingle.thoughtworks.com"
project_url = '/api/v2/projects.xml'

mingle_projects = {}
mingle_pages = {}

response = get_response(base_url + project_url)
response_body = Crack::XML.parse(response.body)["projects"]
response_body.each {|a| mingle_projects.merge!  a["identifier"] => a["name"] }

# mingle_projects.each {|id, name| puts "id: #{id} name: #{name}"}

project_id = "new_scrum_project"

project_pages_url = base_url + "/api/v2/projects/#{project_id}/wiki.xml"  
  
response = get_response(project_pages_url)
response_body = Crack::XML.parse(response.body)["pages"]
response_body.each {|a| mingle_pages.merge!  a["name"] => a["rendered_description"] }

#mingle_pages.each {|name, url| puts "name: #{name} url: #{url}"}


