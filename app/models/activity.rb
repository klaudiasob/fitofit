# frozen_string_literal: true

class Activity < ApplicationRecord
  has_many :points

  validate :two_points?

  private

  def two_points?
    return if points.size == 2

    errors.add(:points, 'Must have two points')
  end
end
