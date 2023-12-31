class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :posts, foreign_key: 'author_id', dependent: :destroy

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def as_json(_options = {})
    { name:,
      bio:,
      id: }
  end

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  def admin?
    role == 'Admin'
  end
end
