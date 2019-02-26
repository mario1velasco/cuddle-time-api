# The controller for User API

class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]
  def index
    @users = User.all
    json_response(@users)
  end

  # GET /users/:id
  def show
    json_response(@user)
  end

  # POST /users
  def create
    @user = User.create!(user_params)
    json_response(@user, :created)
  end

  # PUT /users/:id
  def update
    @user.update(user_params)
    head :no_content
  end

  # DELETE /users/:id
  def destroy
    @user.destroy
    head :no_content
  end

  private

  def user_params
    params.permit(:name,
                  :email,
                  :telephone,
                  :nickname)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
