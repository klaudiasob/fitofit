# frozen_string_literal: true

class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new
    result = ActivityServices::Create.new(@activity, activity_params).call

    if result
      redirect_to @activity, notice: 'Activity was successfully created.'
    else
      render :new
    end
  end

  private

  def activity_params
    params.require(:activity).permit(:start_address, :end_address)
  end
end
