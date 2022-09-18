# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'visiting the index' do
    visit reports_url
    assert_selector 'h1', text: '日報'
  end

  test 'create new report' do
    visit reports_url
    click_on '新規作成'
    fill_in 'タイトル', with: '日報 一日目'
    fill_in '内容', with: '芽ちかく下着。ひがいじぎする不可欠。店舗ぼうず鈍器。'
    click_on '登録する'
    assert_text '日報が作成されました。'
  end

  test 'show report detail page' do
    visit reports_url
    click_link '詳細', match: :first
    assert_text '孤島の鬼'
    click_link '戻る'
  end

  test 'update report' do
    visit reports_url
    click_link '詳細', match: :first
    click_link '編集'
    fill_in 'タイトル', with: '品詞撃つちゅうもんする'
    fill_in '内容', with: '失うけいけんしゃちゅうもんする。廉価とりあえず窒息。当て字米兵しょうかする。'
    click_button '更新する'
    assert_text '日報が更新されました。'
    click_link '戻る'
  end

  test 'destroy report' do
    visit reports_url
    page.accept_confirm do
      click_on '削除', match: :first
    end
    assert_text '日報が削除されました。'
  end
end
