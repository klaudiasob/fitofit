# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  has_many :activities
end
