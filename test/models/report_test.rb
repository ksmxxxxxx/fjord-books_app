# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  setup do
    @user = users(:alice)
    @report = reports(:day1)
  end

  test 'check_to_editable_user' do
    assert @report.editable?(@user)
  end

  test 'convert_to_date_format' do
    assert_equal reports(:day1).created_at.to_date, @report.created_on
  end
end
