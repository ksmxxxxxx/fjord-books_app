# frozen_string_literal: true

class Report < ApplicationRecord
  validates :title, presence: true
  belongs_to :user
end
