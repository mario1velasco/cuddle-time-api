require 'rails_helper'

RSpec.describe TimeTablesController, type: :request do
  let!(:time_tables) { create_list(:time_table, 10) }
  let(:time_table_id) { time_tables.first.id }

  # Test suite for GET /time_tables
  describe 'GET /time_tables' do
    # make HTTP get request before each example
    before { get '/time_tables' }

    it 'returns time_tables' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /time_tables/:id
  describe 'GET /time_tables/:id' do
    before { get "/time_tables/#{time_table_id}" }

    context 'when the record exists' do
      it 'returns the time_table' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(time_table_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:time_table_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find TimeTable/)
      end
    end
  end

  # Test suite for POST /time_tables
  describe 'POST /time_tables' do
    # valid payload
    let(:valid_attributes) { { day: 1,
                               start_time: 60,
                               end_time: 360 } }

    context 'when the request is valid' do
      before { post '/time_tables', params: valid_attributes }

      it 'creates a time_table' do
        expect(json['start_time']).to eq(60)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/time_tables', params: { day: 1,
                                              start_time: 560,
                                              end_time: 360 } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: End time must be later than start_time/)
      end
    end

    context 'when the request is valid whit an user associated' do
      let!(:users) { create_list(:user, 10) }
      let(:user_id) { users.first.id }
      before { post '/time_tables', params: { day: 1,
                                              start_time: 160,
                                              end_time: 360,
                                              assignments_attributes: [{ user_id: 1 }] } }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end

      it 'creates a time_table' do
        expect(json['start_time']).to eq(160)
      end
    end
  end

  # Test suite for GET /users/:user_id/time_tables
  describe 'GET /users/:user_id/time_tables' do
    let!(:user) { create(:user) }
    let!(:time_tables) { create_list(:time_table, 20, user_id: user.id) }
    let(:user_id) { users.first.id }
    let(:id) { time_tables.first.id }
    before { post '/time_tables', params: { day: 1,
                                            start_time: 160,
                                            end_time: 360,
                                            assignments_attributes: [{ user_id: 1 }] } }
    before { get "/users/#{user_id}/time_tables" }

    context 'when user exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all user time_tables' do
        expect(json.size).to eq(10)
      end
    end

    context 'when user does not exist' do
      let(:user_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find User/)
      end
    end
  end
end
