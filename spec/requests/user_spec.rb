require 'rails_helper'

RSpec.describe 'user', type: :request do 
    let(:valid_attributes) {
        {
        'name' => 'Pablo',
        'bio' => 'Hi!',
        'photo' => 'url'
        }
    }

    describe "GET /index" do
        it 'renders a successful response' do
            get users_url
            expect(response).to be_successful
        end
        
        it 'checks http status' do 
            get users_url
            expect(response).to have_http_status(:success)
        end
        
        it 'checks for index template' do
            get users_url
            assert_equal 'index', controller.action_name 
        end
        
        it 'checks for index body content' do 
            get users_url 
            assert_match 'User name', response.body 
        end
    end

    describe 'GET /show' do
        it 'checks http status' do
            get '/users/1'
            expect(response).to have_http_status(:success)
        end

        it 'checks for show template' do
            get '/users/1'
            assert_equal 'show', controller.action_name 
        end

        it 'checks for show body content' do
            get '/users/1'
            assert_match 'Bio', response.body 
        end
    end
end