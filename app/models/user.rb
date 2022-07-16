# frozen_string_literal: true

class User < ApplicationRecord
  has_one_attached :avatar

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :avatar, attached: false, content_type: { in: %w[image/jpeg image/png image/gif], message: 'はPNG、JPEG、GIFが利用できます' }
end
