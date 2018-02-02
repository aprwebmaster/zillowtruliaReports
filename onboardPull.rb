require 'httparty'
require 'json'
require 'csv'

headers = {
      "APIKEY" => "219fcf892e07493cfc5246f9f7e66ba2",
      "Accept" => "application/json"
    }

@response = HTTParty.get("https://search.onboard-apis.com/communityapi/v2.0.0/Area/Full/?AreaId=CO44003", :headers => headers)
 
json = JSON.parse(@response.body)

puts @response.body
puts @response.message.to_json

#onboarddata = File.read('file.txt')
#onboarddata.each_line do |data|
	#Onboard.create(data.to_h)
#end

File.write('file.txt', @response.to_json)


