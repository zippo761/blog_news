require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  context 'GET index' do
    it 'returns a success response' do
      get :index
      expect(response.status).to eq(200)
    end
  end

  context 'GET new' do
    it 'returns a success response' do
      # Mimic the router behavior of setting the Devise scope through the env.
      @request.env['devise.mapping'] = Devise.mappings[:user]

      # Use the sign_in helper to sign in a fixture `User` record.
      sign_in User.first

      get :new

      expect(response.status).to eq(200)
    end
  end
end
