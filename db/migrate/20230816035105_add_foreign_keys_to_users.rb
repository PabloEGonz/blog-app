class AddForeignKeysToUsers < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :comments, :users
    add_foreign_key :comments, :posts
    add_foreign_key :posts, :users, column: :author_id, primary_key: "id"
    add_foreign_key :likes, :users
    add_foreign_key :likes, :posts
  end
end
