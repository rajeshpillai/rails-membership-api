class SessionsController < ApplicationController
  respond_to? :json
  before_action :validate_user!, except: [:create]


  def new
  end

  def create
    p params
    p params[:email]
    user = User.find_by_email(params[:email])

    p user
    
    if user && user.authenticate(params[:password])
      
      # session[:user_id] = user.id 
      # redirect_to root_url, notice: "Logged in"

      render json: user.as_json(only: [:email])
                      .merge("token": user.generate_jwt)

    else 
      # flash.now[:alert] = "Email or password is invalid"
      # render "new"
      render json: { errors: {'email or password': ["is invalid"]}}, 
                    status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil 
    p "FORMAT: ", params[:format]
    #redirect_to root_url, notice: "Logged out!" if params[:format] == "html"
    head(:ok, status: :no_content) # if params[:format] == "json"
  end
end
