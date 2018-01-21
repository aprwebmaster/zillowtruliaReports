require 'httparty'
require 'json'
require 'csv'


@response = HTTParty.get('http://ftapi.trendgraphix.com/Service.aspx?service=data&reportdates=1/2017,2/2017,3/2017,4/2017,5/2017,6/2017,7/2017,8/2017,9/2017,10/2017,11/2017,12/2017&datacolumns=12&settingid=286&region=653&location=27482,27485&proptype=2646,373')
 

puts @response.body
puts @response.message

#onboarddata = File.read('file.txt')
#onboarddata.each_line do |data|
	#Onboard.create(data.to_h)
#end

File.write('soldvslisting.txt', @response.body)


