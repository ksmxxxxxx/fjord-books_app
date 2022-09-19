# frozen_string_literal: true

require 'application_system_test_case'

class RelationshipsTest < ApplicationSystemTestCase
  setup do
    visit root_url

    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'Show all follower list' do
    visit "/users/#{users(:alice).id}"
    assert_selector 'h1', text: 'ユーザの詳細'

    click_link 'フォロワー'
    assert_selector 'h1', text: 'フォロワー'
  end

  test 'Show all following list' do
    visit "/users/#{users(:bob).id}"
    assert_selector 'h1', text: 'ユーザの詳細'

    click_link 'フォロー'
    assert_selector 'h1', text: 'フォロー'
  end

  test 'Following user' do
    visit "/users/#{users(:bob).id}"
    assert_selector 'h1', text: 'ユーザの詳細'

    find_button('フォローする').click
    assert_text 'フォローしました。'
  end

  test 'Unfollow user' do
    visit "/users/#{users(:carol).id}"
    assert_selector 'h1', text: 'ユーザの詳細'

    find_button('フォロー解除する').click
    assert_text 'フォロー解除しました。'
  end
end
