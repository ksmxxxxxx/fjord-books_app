# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:cherry_book)

    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'Visiting the index' do
    visit books_url
    assert_selector 'h1', text: '本'
  end

  test 'Creating a Book' do
    visit books_url
    click_on '新規作成'

    fill_in 'タイトル', with: '七日七夜'
    fill_in 'メモ', with: '春休みたまご遺失。委員ゆるむがいよう。ぞくごちきゅう交錯。'
    click_on '登録する'

    assert_text '七日七夜'
    assert_text '春休みたまご遺失。委員ゆるむがいよう。ぞくごちきゅう交錯。'
    assert_text '本が作成されました。'
  end

  test 'Updating a Book' do
    visit books_url

    within('table') do
      click_on '編集', match: :first
    end

    fill_in 'タイトル', with: '雉子のはなし'
    fill_in 'メモ', with: 'だくりゅうちかくしえんする。おどろくかいぼうず。おどろくころす店。'
    click_on '更新する'

    assert_text '雉子のはなし'
    assert_text 'だくりゅうちかくしえんする。おどろくかいぼうず。おどろくころす店。'
    assert_text '本が更新されました。'

    click_on '戻る'
  end

  test 'Destroying a Book' do
    visit books_url
    page.accept_confirm do
      within('table') do
        click_on '削除', match: :first
      end
    end

    assert_text '本が削除されました。'
  end
end
