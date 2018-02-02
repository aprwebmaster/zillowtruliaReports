require 'open-uri'
require 'httparty'
require "net/http"


#this is the simplest and fastest way. In the future will use a function to iterate through a text file. 

File.write 'lp.txt', open('http://syndication.enterprise.websiteidx.com/feeds/LuxuryPortfolio/Alain_Pinel_Realtors.txt').read
puts "Luxury Portfolio Feed Downloaded"
File.write 'zillow.xml', open('http://syndication.enterprise.websiteidx.com/feeds/Zillow_ZIF/44.xml').read
puts "Zillow Feed Downloaded"
File.write 'Homelink.xml', open('http://syndication.enterprise.websiteidx.com/feeds/Homelink/44.xml').read
puts "Homelink Feed Downloaded"
File.write 'WorldPostings.xml', open('http://syndication.enterprise.websiteidx.com/feeds/WorldPostings/44.xml').read
puts "World Postings Feed Downloaded"
File.write 'Reach.xml', open('http://syndication.enterprise.websiteidx.com/feeds/Reach/44.xml').read
puts "Reach Feed Downloaded"
File.write 'Xpressdocs.xml', open('http://syndication.enterprise.websiteidx.com/feeds/Xpressdocs/XpressDocs%20-%20XpressDocs%20-%2020160926.xml').read
puts "Xpressdocs Feed Downloaded"
File.write 'lp.txt', open('http://syndication.enterprise.websiteidx.com/feeds/LuxuryPortfolio/Alain_Pinel_Realtors.txt').read
puts "Luxury Portfolio Feed Downloaded"
File.write 'LRE.xml', open('http://syndication.enterprise.websiteidx.com/feeds/LREv2/44.xml').read
puts "LeadingRE Feed Downloaded"
File.write 'Realtor.txt', open('http://syndication.enterprise.websiteidx.com/feeds/RealtorDotCom/Alain_Pinel_Realtors/Property.txt').read
puts "RealtorDotCom Feed Downloaded"
File.write 'signs.txt', open('http://www.apr.com/excel.txt').read
puts "Dee Signs Feed Downloaded"
File.write 'SFGate.txt', open('http://syndication.enterprise.websiteidx.com/feeds/SFGate_v2/Alain_Pinel_Realtors.txt').read
puts "SFGate Feed Downloaded"

#Doesn't work with url's 
#File.write 'smarteragent.csv', open('http://apr.com/smarterAgentAgents/APR-smarterAgent-agents-2018-02_01.csv').read
#puts "Smarter Agent Feed Downloaded"

puts "Datafeeds successfully written!"









