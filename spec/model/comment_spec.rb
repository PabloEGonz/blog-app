require 'rails_helper'

RSpec.describe Comment, type: :model do
    author = User.new(name: 'Rhaenyra', photo: 'url', bio: 'Queen')
    post = Post.new(author: author, title: 'The rightful heir', text: 'My father!')
    subject { Comment.new(post: post, user: author, text: 'My story') }

    before { subject.save }
    
    it "Makes sure when you add a comments it add it to the counter" do
        counter = subject.post.comments_counter
        expect(counter).to eq(1)
    end
    it "Can access the author's name" do
        author_name = subject.user.name
        expect(author_name).to eq('Rhaenyra')
    end
    it "Tests the counter" do
        counter = subject.post.comments_counter
        expect(counter).to eq(3)
    end
    it "Can access the post's title" do
        post_title = subject.post.title
        expect(post_title).to eq('The rightful heir')
    end
end