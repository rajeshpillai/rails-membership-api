class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
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
    redirect_to root_url, notice: "Logged out!"
  end
end
