class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_save :update_likes_counter

  def as_json(_options={})
    { :author_id => self.author_id, 
    :text => self.text, 
  :id => self.id }
  end
  private

  def update_likes_counter
    post.increment!(:likes_counter)
  end
end
