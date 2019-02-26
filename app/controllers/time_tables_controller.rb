class TimeTablesController < ApplicationController
  before_action :set_time_table, only: %i[show update destroy]

  # GET /time_tables
  def index
    @time_tables = TimeTable.all
    json_response(@time_tables)
  end

  # GET /time_tables/:id
  def show
    json_response(@time_table)
  end

  # POST /time_tables
  def create
    # @timetable = TimeTable.new(time_table_params)
    # binding.pry
    @time_table = TimeTable.create!(time_table_params)
    # @timetable.save!
    json_response(@time_table, :created)
  end

  private

  def time_table_params
    params.permit(:day,
                  :start_time,
                  :end_time,
                  :nickname,
                  assignments_attributes: %i[id user_id])
  end

  def set_time_table
    @time_table = TimeTable.find(params[:id])
  end
end
