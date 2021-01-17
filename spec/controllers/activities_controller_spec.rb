# frozen_string_literal: true

require 'rails_helper'
RSpec.describe ActivitiesController, type: :controller do
  describe 'GET #index' do
    it 'assigns @activities' do
      activities = create_list(:activity, 5, :with_2_points)
      get :index
      expect(assigns(:weekly_distance)).to eq(activities.sum(&:distance))
      expect(assigns(:activities_by_day)).to eq(Activity.all.group_by_day(:created_at).sum(:distance))
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'POST #create' do
    subject { post :create, params: params }

    before do
      allow(Activity).to receive(:new).and_return(activity)
    end

    let(:activity) { Activity.new }
    let(:params) do
      {
        activity: {
          start_address: 'Plac Europejski 2, Warszawa, Polska',
          end_address: 'plac Żelaznej Bramy 1, Warszawa, Polska'
        }
      }
    end

    it 'calls ActivityServices::Create' do
      activity_params = ActionController::Parameters.new(params[:activity]).permit(:start_address, :end_address)

      expect(ActivityServices::Create).to receive(:new).with(activity, activity_params).and_call_original
      expect_any_instance_of(ActivityServices::Create).to receive(:call)

      subject
    end
  end
end
