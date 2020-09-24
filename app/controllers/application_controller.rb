class ApplicationController < ActionController::Base
  # protect_from_forgery with: :reset_session
  protect_from_forgery unless: -> { request.format.json?}

  before_action :validate_user!, except: [:login]
  

  private
  def validate_user! 
    true
  end
end
