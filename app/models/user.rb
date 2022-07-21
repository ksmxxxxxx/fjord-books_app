# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :active_relationships, class_name: 'Following',
                                  foreign_key: 'follower_id',
                                  inverse_of: 'follower',
                                  dependent: :destroy

  has_many :followees,
           through: :active_relationships,
           source: :follower

  has_many :passive_relatioships, class_name: 'Following',
                                  foreign_key: 'followed_id',
                                  inverse_of: 'followed',
                                  dependent: :destroy

  has_many :followers,
           through: :passive_relatioships,
           source: :followed
end
