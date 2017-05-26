# dotenv ruby app/models/propublica_api.rb
require 'uri'
require 'net/http'
require 'openssl'
require 'json'

# class CongressMembers
  url = URI("https://api.propublica.org/congress/v1/115/house/members.json")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE

  request = Net::HTTP::Get.new(url)
  request["x-api-key"] = ENV['PROPUBLICA_KEY']
  request["cache-control"] = 'no-cache'
  request["postman-token"] = ENV['PROPUBLICA_POSTMAN_TOKEN']

  response = http.request(request)
  pre_parse = response.read_body
  house_members_115 = JSON.parse(pre_parse)

  house_members_115_details = house_members_115["results"][0]["members"]
  house_members_115_details.each_with_index do |member, i|
    p house_members_115_details[i]["first_name"]
    p house_members_115_details[i]["last_name"]
    p house_members_115_details[i]["state"]
    p house_members_115_details[i]["party"]
    p house_members_115_details[i]["votes_with_party_pct"]
  end

# end
