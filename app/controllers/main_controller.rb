class MainController < ApplicationController
  def landing
  	if user_signed_in?
  		redirect_to(main_home_path)
  	end
  end

  def home
  	if !user_signed_in?
  		redirect_to(main_landing_path)
  	end
  end
end
