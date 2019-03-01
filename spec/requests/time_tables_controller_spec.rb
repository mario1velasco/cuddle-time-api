require 'rails_helper'

RSpec.describe TimeTablesController, type: :request do
  let!(:user) { create(:user) }
  let!(:time_table) { create(:time_table) }
  let(:user_id) { user.id }
  let(:time_table_id) { time_table.id }
  let!(:assignment) { create(:assignment, user_id: user_id, time_table_id: time_table_id) }

  # Test suite for GET /users/:user_id/time_tables
  describe 'GET /users/:user_id/time_tables' do
    # before { post '/time_tables', params: { day: 1, start_time: 160, end_time: 360 assignments_attributes: [{ user_id: 1 }] } }
    context 'when user exists' do
      before { get "/users/#{user_id}/time_tables" }
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all user time_tables' do
        expect(json.size).to eq(1)
      end
    end

    context 'when user does not exist' do
      before { get '/users/56/time_tables' }
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find User/)
      end
    end
  end

  # Test suite for GET /users/:user_id/time_tables/:id
  describe 'GET /users/:user_id/time_tables/:id' do
    context 'when user time_table exists' do
      before { get "/users/#{user_id}/time_tables/#{time_table_id}" }
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the time_table' do
        expect(json['id']).to eq(time_table_id)
      end
    end

    context 'when user time_table does not exist' do
      before { get "/users/#{user_id}/time_tables/0" }
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find TimeTable/)
      end
    end
  end

  # Test suite for POST /users/:user_id/time_tables
  describe 'POST /users/:user_id/time_tables' do
    let(:valid_attributes) { { day: 3, start_time: 100, end_time: 900 } }

    context 'when request attributes are valid' do
      before { post "/users/#{user_id}/time_tables", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/users/#{user_id}/time_tables", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Day can't be blank/)
      end
    end
  end

  # Test suite for PUT /users/:user_id/time_tables/:id
  describe 'PUT /users/:user_id/time_tables/:id' do
    context 'when time_tables exists' do
      let(:valid_attributes) { { day: 2 } }

      before { put "/users/#{user_id}/time_tables/#{time_table_id}", params: valid_attributes }
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the time_tables' do
        updated_time_tables = TimeTable.find(time_table_id)
        expect(updated_time_tables.day).to match(2)
      end
    end

    context 'when the time_tables does not exist' do
      before { put "/users/#{user_id}/time_tables/#{0}", params: {} }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find TimeTable/)
      end
    end
  end
end
