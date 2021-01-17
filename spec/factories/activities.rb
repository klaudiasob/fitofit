# frozen_string_literal: true

FactoryBot.define do
  factory :activity do
    distance { rand(1..10) }

    trait :with_2_points do
      points { build_list(:point, 2) }
    end

    trait :with_3_points do
      points { build_list(:point, 3) }
    end
  end
end
