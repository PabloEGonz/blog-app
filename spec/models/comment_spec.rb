require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'Makes sure when you add a comment it increases the counter' do
    author = User.create(name: 'Rhaenyra', photo: 'url', bio: 'Queen')
    post = Post.create(author: author, title: 'The rightful heir', text: 'My father!')
    subject = Comment.new(post: post, user: author, text: 'My story')
    
    expect { subject.save }.to change { post.reload.comments_counter }.by(1)
  end

  it "Can access the author's name" do
    author = User.create(name: 'Rhaenyra', photo: 'url', bio: 'Queen')
    post = Post.create(author: author, title: 'The rightful heir', text: 'My father!')
    subject = Comment.create(post: post, user: author, text: 'My story')

    author_name = subject.user.name
    expect(author_name).to eq('Rhaenyra')
  end

  it "Can access the post's title" do
    author = User.create(name: 'Rhaenyra', photo: 'url', bio: 'Queen')
    post = Post.create(author: author, title: 'The rightful heir', text: 'My father!')
    subject = Comment.create(post: post, user: author, text: 'My story')

    post_title = subject.post.title
    expect(post_title).to eq('The rightful heir')
  end
end

