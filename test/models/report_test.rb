# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  setup do
    @user = users(:alice)
    @report_by_alice = reports(:report_by_alice)
  end

  test 'Check to writer is alice' do
    assert @report_by_alice.editable?(@user)
  end

  test 'Convert to date format' do
    assert_equal reports(:report_by_alice).created_at.to_date, @report_by_alice.created_on
  end
end
