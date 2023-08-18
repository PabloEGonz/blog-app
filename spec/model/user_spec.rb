require 'rails_helper'

RSpec.describe User, type: :model do
    subject { User.new(name: 'Rhaenyra', photo: 'https://pbs.twimg.com/media/FkLrCMbWAAMbd7G.jpg', bio: 'Queen of the seven kingdoms')}

    before { subject.save }

    it 'name is black should be invalid' do 
        subject.name = nil
        expect(subject).to_not be_valid
    end
    it 'name is white space should be invalid' do 
        subject.name = ' '
        expect(subject).to_not be_valid
    end
    it 'posts_counter float number should be invalid' do 
        subject.posts_counter = 2.0
        expect(subject).to_not be_valid
    end
    it 'less than 0 should be invalid' do 
        subject.posts_counter = -2
        expect(subject).to_not be_valid
    end
end