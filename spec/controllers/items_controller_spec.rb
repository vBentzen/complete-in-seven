require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  let(:user) { create(:user)}
  let(:item) { create(:item) }

  describe "POST create" do
    it 'should increase the number of Item by 1' do
      expect{post :create, user_id: user.id, item: {name: Faker::StarWars.character, user: user } }.to change(Item,:count).by(1)
    end

    it 'should redirect to the user profile show view' do
      post :create, user_id: user.id, item: {name: Faker::StarWars.character, user: user}
      expect(response).to redirect_to(user_path(current_user))
    end
  end
end
