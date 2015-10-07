require 'rails_helper'

RSpec.describe TodosController, type: :controller do
  context 'GET #index' do
    before { get :index }

    it { is_expected.to respond_with 200 }
  end
end