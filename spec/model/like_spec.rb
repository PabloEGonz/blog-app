require 'rails_helper'

RSpec.describe Like, type: :model do
    user = User.new(name: 'Rhaenyra', photo: 'url', bio: 'Queen')
    post = Post.new(author: user, title: 'The rightful heir', text: 'My father!')
    subject { Like.new(user: user, post: post) }

    before { subject.save }

    it "Makes sure when you add a like it add it to the counter" do
        counter = subject.post.likes_counter
        expect(counter).to eq(1)
    end
    it "Can access the author's name" do
        author_name = subject.user.name
        expect(author_name).to eq('Rhaenyra')
    end
    it "Tests the counter" do
        counter = subject.post.likes_counter
        expect(counter).to eq(3)
    end
    it "Can access the post's title" do
        post_title = subject.post.title
        expect(post_title).to eq('The rightful heir')
    end
end