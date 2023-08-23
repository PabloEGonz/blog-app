require 'rails_helper'

RSpec.describe 'post', type: :request do
    author = User.new(name: 'Rhaenyra', photo: 'url', bio: 'Queen')

    let(:valid_attributes) {
        {
        'author' => author,
        'title' => 'Why I am the rightful heir',
        'text' => 'My father!'
        }
    }

    describe 'GET /index' do 
        it 'renders a successful response' do
            get '/users/1/posts'
            expect(response).to be_successful
        end

        it 'checks http status' do
            get '/users/1/posts'
            expect(response).to have_http_status(:success)
        end

        it 'checks for index template' do
            get '/users/1/posts'
            assert_equal 'index', controller.action_name 
        end

        it 'checks for index body content' do 
            get '/users/1/posts'
            assert_match 'Number of posts', response.body 
        end
    end

    describe 'GET /show' do
        it 'checks http status' do
            get '/users/1/posts/1'
            expect(response).to have_http_status(:success)
        end

        it 'checks for show template' do
            get '/users/1/posts/1'
            assert_equal 'show', controller.action_name 
        end

        it 'checks for show body content' do
            get '/users/1/posts/1'
            assert_match 'Comments', response.body 
        end
    end

end    