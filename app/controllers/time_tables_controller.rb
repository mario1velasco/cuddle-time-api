class TimeTablesController < ApplicationController
  before_action :set_user
  before_action :set_user_time_table, only: %i[show update destroy]

  # GET /users/:user_id/time_tables
  def index
    json_response(@user.time_tables)
  end

  # GET /users/:user_id/time_tables/:id
  def show
    json_response(@time_table)
  end

  # POST /users/:user_id/time_tables
  def create
    @user.time_tables.create!(time_table_params)
    json_response(@user, :created)
  end

  # PUT /users/:user_id/time_tables/:id
  def update
    @time_table.update(time_table_params)
    head :no_content
  end

  # DELETE /users/:user_id/time_tables/:id
  def destroy
    @time_table.destroy
    head :no_content
  end

  private

  def time_table_params
    params.permit(:day,
                  :start_time,
                  :end_time,
                  :nickname,
                  assignments_attributes: %i[id user_id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_user_time_table
    @time_table = @user.time_tables.find_by!(id: params[:id]) if @user
  end
end
