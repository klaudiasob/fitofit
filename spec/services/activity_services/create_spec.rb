# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ActivityServices::Create do
  subject { described_class.new(activity, activity_params, user).call }

  let(:activity) { Activity.new }
  let(:user) { create(:user) }

  describe '.call' do
    context 'with valid params' do
      let(:activity_params) do
        { start_address: 'Plac Europejski 2, Warszawa, Polska',
          end_address: 'plac Żelaznej Bramy 1, Warszawa, Polska' }
      end

      it 'creates activity' do
        expect { subject }.to change(user.activities, :count).by(1)
      end
    end

    context 'with invalid params' do
      let(:activity_params) do
        {
          activity: {
            start_address: 'Plac Europejski 2, Warszawa, Polska',
            end_address: 'Plac Polski 1234, Walszawa, Polska'
          }
        }
      end

      it 'does not save the new activity' do
        expect { subject }.not_to change(Activity, :count)
      end
    end
  end
end
