# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:alice)
    @me = users(:alice)
    @they = users(:bob)
  end

  test 'Login with email or name' do
    assert_equal 'alice@example.com', @user.name_or_email

    @user.name = 'Alice'
    assert_equal 'Alice', @user.name_or_email
  end

  test 'User can follow' do
    assert_not @me.following?(@they)
    @me.follow(@they)

    assert @me.following?(@they)
  end

  test 'User can unfollow' do
    assert_not @me.following?(@they)
    @me.follow(@they)

    assert @me.following?(@they)
    @me.unfollow(@they)
    assert_not @me.following?(@they)
  end

  test 'User can check to see if they are being followed' do
    assert_not @me.followed_by?(@they)
    @they.follow(@me)

    assert @me.followed_by?(@they)
  end
end
