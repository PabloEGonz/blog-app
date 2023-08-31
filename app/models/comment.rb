class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :text, presence: true

  after_save :update_comments_counter

  def as_json(_options = {})
    { user_id:,
      text:,
      id: }
  end

  private

  def update_comments_counter
    post.increment!(:comments_counter)
  end
end
