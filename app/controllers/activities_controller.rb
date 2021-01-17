# frozen_string_literal: true

class ActivitiesController < ApplicationController
  before_action :authenticate_user!

  def index
    activities = Activity.all
    @weekly_distance = activities.this_week.sum(:distance)
    @activities_by_day = activities.this_month.group_by_day(:created_at).sum(:distance)
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new
    result = ActivityServices::Create.new(@activity, activity_params).call

    if result
      redirect_to activities_path, notice: 'Activity was successfully created.'
    else
      render :new
    end
  end

  private

  def activity_params
    params.require(:activity).permit(:start_address, :end_address)
  end
end
