require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'Makes sure when you add a like it add it to the counter' do
    user = User.create(name: 'Rhaenyra', photo: 'url', bio: 'Queen')
    post = Post.create(author: user, title: 'The rightful heir', text: 'My father!')
    subject = Like.new(user:, post:)

    expect { subject.save }.to change { post.reload.likes_counter }.by(1)
  end

  it "Can access the author's name" do
    user = User.create(name: 'Rhaenyra', photo: 'url', bio: 'Queen')
    post = Post.create(author: user, title: 'The rightful heir', text: 'My father!')
    subject = Like.create(user:, post:)
    author_name = subject.user.name
    expect(author_name).to eq('Rhaenyra')
  end

  it "Can access the post's title" do
    user = User.create(name: 'Rhaenyra', photo: 'url', bio: 'Queen')
    post = Post.create(author: user, title: 'The rightful heir', text: 'My father!')
    subject = Like.create(user:, post:)
    post_title = subject.post.title
    expect(post_title).to eq('The rightful heir')
  end
end
