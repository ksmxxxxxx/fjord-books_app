# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'login_with_email_or_name' do
    user = User.new(email: 'foo@example.com', name: '')
    assert_equal 'foo@example.com', user.name_or_email

    user.name = 'bar'
    assert_equal 'bar', user.name_or_email
  end

  test 'user_can_follow' do
    me = User.create!(email: 'me@example.com', password: 'password')
    they = User.create!(email: 'they@example.com', password: 'password')

    assert_not me.following?(they)
    me.follow(they)

    assert me.following?(they)
  end

  test 'user_can_unfollow' do
    me = User.create!(email: 'me@example.com', password: 'password')
    they = User.create!(email: 'they@example.com', password: 'password')

    assert_not me.following?(they)
    me.follow(they)

    assert me.following?(they)
    me.unfollow(they)
    assert_not me.following?(they)
  end

  test 'user_can_check_to_see_if_they_are_being_followed' do
    me = User.create!(email: 'me@example.com', password: 'password')
    they = User.create!(email: 'they@example.com', password: 'password')

    assert_not me.followed_by?(they)
    they.follow(me)

    assert me.followed_by?(they)
  end
end
