class Api::V1::UsersController < ApplicationController
  def create
    @user = User.new(sign_up_params)

    if @user.save
      render json: @user.to_json, status: :created
    else
      render json: @user.errors.to_json, status: :unprocessable_entity
    end
  end

  def destroy; end

  def update; end

  private

  def sign_up_params
    params.permit(:name, :phone_number, :email, :password)
  end
end
