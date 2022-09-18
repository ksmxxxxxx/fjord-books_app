# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    @report = reports(:day1)
    @report_update = reports(:day1_update)

    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'Visiting the index' do
    visit reports_url
    assert_selector 'h1', text: '日報'
  end

  test 'Creating a new report' do
    visit reports_url
    click_on '新規作成'
    fill_in 'タイトル', with: @report.title
    fill_in '内容', with: @report.content
    click_on '登録する'
    assert_text '日報が作成されました。'
  end

  test 'Seeing to a report detail page' do
    visit reports_url
    click_link '詳細', match: :first
    assert_text @report.title
    click_link '戻る'
  end

  test 'Updating a report' do
    visit reports_url
    click_link '詳細', match: :first
    click_link '編集'
    fill_in 'タイトル', with: @report_update.title
    fill_in '内容', with: @report_update.content
    click_button '更新する'
    assert_text '日報が更新されました。'
    click_link '戻る'
  end

  test 'Destroing a report' do
    visit reports_url
    page.accept_confirm do
      click_on '削除', match: :first
    end
    assert_text '日報が削除されました。'
  end
end
