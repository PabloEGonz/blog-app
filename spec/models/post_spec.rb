require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'Long title should be invalid' do
    author = User.new(name: 'Rhaenyra', photo: 'url', bio: 'Queen')
    subject = Post.new(author:, title: 'Why I am the rightful heir', text: 'My father!')
    subject.title = 'a' * 260
    expect(subject).to_not be_valid
  end
  it 'likes counter not an integer should be invalid' do
    author = User.new(name: 'Rhaenyra', photo: 'url', bio: 'Queen')
    subject = Post.new(author:, title: 'Why I am the rightful heir', text: 'My father!')
    subject.likes_counter = 2.0
    expect(subject).to_not be_valid
  end
  it 'comments counter not an integer should be invalid' do
    author = User.new(name: 'Rhaenyra', photo: 'url', bio: 'Queen')
    subject = Post.new(author:, title: 'Why I am the rightful heir', text: 'My father!')
    subject.comments_counter = 6.0
    expect(subject).to_not be_valid
  end
  it 'likes counter less than 0 should be invalid' do
    author = User.new(name: 'Rhaenyra', photo: 'url', bio: 'Queen')
    subject = Post.new(author:, title: 'Why I am the rightful heir', text: 'My father!')
    subject.likes_counter = -9
    expect(subject).to_not be_valid
  end
  it 'comments counterless than 0 should be invalid' do
    author = User.new(name: 'Rhaenyra', photo: 'url', bio: 'Queen')
    subject = Post.new(author:, title: 'Why I am the rightful heir', text: 'My father!')
    subject.comments_counter = -10
    expect(subject).to_not be_valid
  end
end
