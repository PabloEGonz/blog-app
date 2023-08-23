require 'rails_helper'

RSpec.describe 'user', type: :request do 
    let(:valid_attributes) {
        {
        'name' => 'Pablo',
        'bio' => 'Hi!',
        'photo' => 'url'
        }
    }

    let(:invalid_attributes) {
        {
        'name' => '',
        'bio' => 'Hi!',
        'photow' => 'url'
        }
    }

    describe "GET /index" do
        it 'renders a successful response' do
            User.create! valid_attributes
            get users_url
            expect(response).to be_successful
        end
    end
end