# frozen_string_literal: true

class FollowingsController < ApplicationController
  def create
    current_user.follow(params[:id])
    if current_user.save
      redirect_to user_path
    else
      redirect_to user_path, notice: t('controllers.common.notice_already_following')
    end
  end

  def destroy
    current_user.unfollow(params[:id])
    redirect_to user_path
  end
end
