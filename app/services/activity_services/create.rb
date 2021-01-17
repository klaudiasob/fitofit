# frozen_string_literal: true

module ActivityServices
  class Create
    attr_reader :activity, :params

    def initialize(activity, params)
      @activity = activity
      @params = params
    end

    def call
      create_start_and_end_points
      calculate_distance
      activity.save
    end

    private

    def create_start_and_end_points
      activity.points.build(
        [
          { address: params[:start_address] },
          { address: params[:end_address] }
        ]
      )
    end

    def calculate_distance
      activity.distance = activity.points.first.distance_to(activity.points.last)
    end
  end
end
