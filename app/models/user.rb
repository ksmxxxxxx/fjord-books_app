# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :active_relationships, class_name: 'Following',
                                  foreign_key: 'follower_id',
                                  inverse_of: 'follower',
                                  dependent: :destroy

  has_many :followings,
           through: :active_relationships,
           source: :followed

  has_many :passive_relationships, class_name: 'Following',
                                   foreign_key: 'followed_id',
                                   inverse_of: 'followed',
                                   dependent: :destroy

  has_many :followers,
           through: :passive_relationships,
           source: :follower

  def follow(followed_user_id)
    active_relationships.create(followed_id: followed_user_id).valid?
  end

  def unfollow(followed_user_id)
    return active_relationships.find_by!(followed_id: followed_user_id).destroy if following?(User.find_by!(id: followed_user_id))
  end

  def following?(user)
    followings.include?(user)
  end
end
