# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Activity, type: :model do
  subject { activity }

  let(:activity) { build(:activity) }

  describe 'associations' do
    it { is_expected.to have_many(:points).class_name('Point') }
    it { is_expected.to belong_to(:user).class_name('User') }
  end

  describe 'validations' do
    context 'without points' do
      it 'is invalid' do
        expect(subject.valid?).to be false
      end
    end

    context 'with more than two points' do
      let(:activity) { build(:activity, :with_3_points) }

      it 'is invalid' do
        expect(subject.valid?).to be false
      end
    end

    context 'with two points' do
      let(:activity) { build(:activity, :with_2_points) }

      it 'is valid' do
        expect(subject.valid?).to be true
      end
    end
  end
end
