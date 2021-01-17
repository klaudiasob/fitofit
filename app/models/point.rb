# frozen_string_literal: true

class Point < ApplicationRecord
  belongs_to :activity

  geocoded_by :address
  after_initialize :geocode
  validates_presence_of :address, :latitude, :longitude
end
