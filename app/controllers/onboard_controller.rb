class OnboardController < ApplicationController
  def initialize
	@onboard = Onboard.new
  end
end
