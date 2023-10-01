class Api::V1::SessionsController < ApplicationController
  def create
    user = User.where(email: params[:email]).first

    if user&.valid_password?(params[:password])
      render json: user.as_json(only: %i[email authentication_token]), status: :created
    else
      head(:unauthorized)
    end
  end

  def destroy
    user = User.where(id: params[:id]).first
    user.update(authentication_token: nil)
  end
end
