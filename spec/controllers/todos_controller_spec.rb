require 'rails_helper'

RSpec.describe TodosController, type: :controller do
  context 'GET #index' do
    before { get :index }

    it { is_expected.to respond_with :success }
  end

  context 'POST #create' do
    context 'valid data' do
      let(:post_response) { post(:create, todo: { name: 'Test' }) }

      it do
        post_response
        is_expected.to respond_with :success
      end

      it 'creates a todo' do
        post_response
        expect(Todo.find_by_name 'Test').to_not be_nil
      end
    end
  end

  context 'invalid data' do
    let(:post_response) { post(:create, todo: { name: nil }) }

    it do
      post_response
      is_expected.to respond_with :unprocessable_entity
    end

    it 'does not create a todo' do
        expect {
          post_response
        }.to_not change { Todo.count }
      end
  end
end