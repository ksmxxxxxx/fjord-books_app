# frozen_string_literal: true

class Report < ApplicationRecord
  validates :title, presence: true
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy

  def build_comment(comment_params, user_id)
    @comment = comments.build(comment_params)
    @comment.user_id = user_id
    @comment
  end
end
