class WelcomeController < ApplicationController
  
    require 'net/http'
    require 'uri'
    require 'json'
    require 'httparty'
   

  def index
  end

  def zillow
  end

  def trulia
  end

  def listglobally
  end

  def blackknight
  end
  
  def propertyvalue
  end

  def mediansales
  end

  def propertyinformationreport
  end

  def comparablesales
  end

  def neighborhoodv  
  end

  def annualpercentage
  end

  def unitsales
  end

  def salesbyrange
  end

  def forclosures

  end

  def marketreports
    headers = {
      "APIKEY" => "219fcf892e07493cfc5246f9f7e66ba2",
      "Accept" => "application/json"
    }
  @response = HTTParty.get("https://search.onboard-apis.com/communityapi/v2.0.0/Area/Full/?AreaId=CO44003", :headers => headers)
 
  JSON.parse(@response.body)


  end



end
