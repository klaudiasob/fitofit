# frozen_string_literal: true

class Activity < ApplicationRecord
  has_many :points
  belongs_to :user
  validate :two_points?

  attr_reader :start_address, :end_address

  scope :this_week, -> { where(created_at: Time.now.beginning_of_week..Time.now.end_of_week) }
  scope :this_month, -> { where(created_at: Time.now.beginning_of_month..Time.now.end_of_month) }

  private

  def two_points?
    return if points.size == 2

    errors.add(:points, 'Must have two points')
  end
end
