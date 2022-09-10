# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update destroy]

  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
    redirect_to polymorphic_url(@commentable), alert: t('controllers.common.notice_alert') unless @comment.user_id == current_user.id
  end

  # POST /comments or /comments.json
  def create
    @comment = @commentable.build_comment(comment_params, current_user.id)

    if @comment.save
      redirect_to polymorphic_url(@commentable), notice: t('controllers.common.notice_create', name: Comment.model_name.human)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    if @comment.update(comment_params)
      redirect_to polymorphic_url(@commentable), notice: t('controllers.common.notice_update', name: Comment.model_name.human)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    if @comment.user_id == current_user.id
      @comment.destroy

      redirect_to polymorphic_url(@commentable), notice: t('controllers.common.notice_destroy', name: Comment.model_name.human)
    else
      redirect_to polymorphic_url(@commentable), alert: t('controllers.common.notice_alert')
    end
  end

  private

  # Use callbacks to share common setup or constraints between
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:content)
  end
end
