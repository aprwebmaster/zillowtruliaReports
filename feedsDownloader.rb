require 'open-uri'

File.write 'zillow.xml', open('http://syndication.enterprise.websiteidx.com/feeds/Zillow_ZIF/44.xml').read