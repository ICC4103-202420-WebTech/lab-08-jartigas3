class HomeController < ApplicationController
  def index
    redirect_to training_sessions_path if user_signed_in?
  end
end