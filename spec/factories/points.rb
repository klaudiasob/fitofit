# frozen_string_literal: true

FactoryBot.define do
  factory :point do
    address { FFaker::AddressPL.full_address }
    latitude { FFaker::Geolocation.lat }
    longitude { FFaker::Geolocation.lng }
    activity
  end
end
