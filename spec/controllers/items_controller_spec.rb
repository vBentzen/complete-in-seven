require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  let(:user) { create(:user)}
  let(:item) { create(:item) }

  describe "GET new" do
    it 'should return http success' do
      get :new
      expect(response).to have_http_status(:success)
    end

    it 'should render the #new view' do
      get :new
      expect(response).to render_template :new
    end

    it 'should instantiate a new @item' do
      get :new
      expect(assigns(:item)).not_to be_nil
    end
  end

  describe "POST create" do
    it 'should increase the number of Item by 1' do
      expect{post :create, item: {name: Faker::StarWars.character, user: user}}.to change(Item,:count).by(1)
    end

    it 'should assign the new item to @item' do
      post :create, item: {name: Faker::StarWars.character, user: user}
      expect(assigns(:item)).to eq Item.last
    end
  end



end
