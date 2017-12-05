require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  let(:user) { create(:user)}
  let(:item) { create(:item) }


  describe "POST create" do
    before do
      sign_in user
    end
    it 'should increase the number of Item by 1' do
      expect{post :create, user_id: user.id, item: {name: Faker::StarWars.character, user: user } }.to change(Item,:count).by(1)
    end

    it 'should redirect to the user profile show view' do
      post :create, user_id: user.id, item: {name: Faker::StarWars.character, user: user}
      expect(response).to redirect_to(root_path)
    end
  end

  describe "DELETE destroy" do
    before do
      sign_in user
    end
    it 'should delete the comment' do
      delete :destroy, user_id: user.id, id: item.id
      count = Item.where ({ id: item.id }).count
      expect(count).to eq 0
    end

    it 'should redirect to the user profile show view' do
      delete :destroy, user_id: user.id, id: item.id
      expect(response).to redirect_to(root_path)
    end
  end
end
