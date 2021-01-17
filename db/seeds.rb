# frozen_string_literal: true

user = FactoryBot.create(:user, email: 'user@example.com', password: 'password')

FactoryBot.create_list(:activity, 4, :with_2_points, user: user, created_at: Time.now.beginning_of_month)
FactoryBot.create_list(:activity, 2, :with_2_points, user: user, created_at: Time.now.yesterday)
FactoryBot.create_list(:activity, 2, :with_2_points, user: user, created_at: Time.now.tomorrow)
FactoryBot.create(:activity, :with_2_points, user: user, created_at: Time.now.end_of_month)