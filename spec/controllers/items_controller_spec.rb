require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  let(:user) { create(:user)}
  let(:item) { create(:item) }

  describe "POST create" do
    it 'should increase the number of Item by 1' do
      sign_in user
      expect{post :create, user_id: user.id, item: {name: Faker::StarWars.character, user: user } }.to change(Item,:count).by(1)
    end

    it 'should redirect to the user profile show view' do
      sign_in user
      post :create, user_id: user.id, item: {name: Faker::StarWars.character, user: user}
      expect(response).to redirect_to(root_path)
    end
  end
end
