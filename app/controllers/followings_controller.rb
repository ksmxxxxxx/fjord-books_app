# frozen_string_literal: true

class FollowingsController < ApplicationController
  def create
    if current_user.following?(User.find_by!(params[:id]))
      redirect_to user_path, notice: t('controllers.common.notice_already_following')
    else
      current_user.follow(params[:id])
      redirect_to user_path
    end
  end

  def destroy
    if current_user.following?(User.find_by!(params[:id]))
      current_user.unfollow(params[:id])
      redirect_to user_path
    else
      redirect_to user_path, notice: t('controllers.common.notice_already_unfollowed')
    end
  end
end
