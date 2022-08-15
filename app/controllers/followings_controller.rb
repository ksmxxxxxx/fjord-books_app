# frozen_string_literal: true

class FollowingsController < ApplicationController
  def create
    if current_user.follow(params[:id])
      redirect_to user_path
    else
      redirect_to user_path, notice: t('controllers.users.notice_already_following')
    end
  end

  def destroy
    if current_user.unfollow(params[:id])
      redirect_to user_path
    else
      redirect_to user_path, notice: t('controllers.users.notice_already_unfollowed')
    end
  end
end
