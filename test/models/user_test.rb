# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @me = users(:alice)
    @he = users(:bob)
  end

  test 'Login with email or name' do
    assert_equal 'alice@example.com', @me.name_or_email

    @me.name = 'Alice'
    assert_equal 'Alice', @me.name_or_email
  end

  test 'User can follow' do
    assert_not @me.following?(@he)
    @me.follow(@he)

    assert @me.following?(@he)
  end

  test 'User can unfollow' do
    assert_not @me.following?(@he)
    @me.follow(@he)

    assert @me.following?(@he)
    @me.unfollow(@he)
    assert_not @me.following?(@he)
  end

  test 'User can check to see if they are being followed' do
    assert_not @me.followed_by?(@he)
    @he.follow(@me)

    assert @me.followed_by?(@he)
  end
end
