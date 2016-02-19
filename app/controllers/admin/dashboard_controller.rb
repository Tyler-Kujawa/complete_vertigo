class Admin::DashboardController < ApplicationController
	layout "dashboard"
	
	before_filter :authorize
	
  def index	
  end
end
