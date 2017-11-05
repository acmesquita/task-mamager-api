require 'rails_helper'

RSpec.describe 'Task API' do
    before {host! 'api.taskmanager.dev'}

    let!(:user) { create(:user)}
    let(:headers) do
        {
            'Accept' => 'application/vnd.taskmanager.v1',
            'Content-Type' => Mime[:json].to_s,
            'Authorization' => user.auth_token
        }
    end

    describe 'GET /tasks' do
      before do
          create_list(:task, 5, user_id: user.id)
          get '/tasks', params: {}, headers: headers
      end

      it 'returns status code 200' do
          expect(response).to have_http_status(200)
      end
      it 'return 5 tasks from database' do
          expect(json_body[:tasks].count).to eq(5)
      end

    end

    describe 'GET /tasks/:id' do
      let(:task){create(:task, user_id: user.id)}

      before do
        get "/tasks/#{task.id}", params: {}, headers: headers
      end

      it 'returns status code 200' do
          expect(response).to have_http_status(200)
      end

      it 'returns the json for task' do
          expect(json_body[:title]).to eq(task.title)
      end

    end

    describe 'POST /tasks' do
        
        before do
            post '/tasks', params: task_params, headers: headers
        end

        context 'when the params is valid' do
            let(:task_params){ attributes_for(:task)}

            it 'returns status code 201' do
                expect(response).to have_http_status(200)
            end

            it 'save the task in the database' do
                expect(Task.find_by(title: task_params[:title])).not_to_be_nil
            end

            it 'returns the json for creaded task' do
                expect(json_body[:title]).to eq(task_params[:title])
            end

            it 'assing the created task to the current user' do
                expect(json_body[:user_id]).to eq(user.id)
            end
        end

        context 'when the params is invalid' do
        end
      
    end
end