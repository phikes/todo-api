require 'rails_helper'

RSpec.describe TodosController, type: :controller do
  context 'GET #index' do
    before { get :index }

    it { is_expected.to respond_with :success }
  end

  context 'POST #create' do
    let(:post_response) { post(:create, todo: { name: 'Test' }) }

    it do
      post_response
      is_expected.to respond_with :success
    end

    it 'create a todo' do
      post_response
      expect(Todo.find_by_name 'Test').to_not be_nil
    end
  end
end