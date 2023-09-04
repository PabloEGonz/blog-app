require 'swagger_helper'

RSpec.describe 'api/v1/users', type: :request do

  path '/api/v1/users' do

    get('retrives the users') do
      tags 'Users'
      produces 'application/json'
      response(200, 'successful') do
        schema type: :array,
        items: {
          type: :object,
          properties: {
            name: { type: :string },
            bio: { type: :string },
            photo: { type: :string },
            id: { type: :integer }
          },
          required: ['name', 'bio', 'id']
        }
        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data).to be_an(Array)
          expect(data.length).to eq(User.count)
        end
      end
    end
  end

  path '/api/v1/users/{id}' do

    get('Retrives a user') do
      parameter name: :id, in: :path, type: :string, description: 'id'
      tags 'Users', 'A user'
      produces 'application/json'
      response(200, 'successful') do
        schema type: :object,
        properties: {
          name: { type: :string },
          bio: { type: :string },
          photo: { type: :string },
          id: { type: :integer }
        },
        required: ['name', 'bio', 'photo', 'id']
      
        let(:id) {'2'}
        run_test!
      end
    end
  end
end
