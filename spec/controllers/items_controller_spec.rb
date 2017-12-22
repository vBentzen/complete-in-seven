require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  let(:item) { create(:item) }
  let(:user) { create(:user) }
  
  let!(:item) { create :item, user: user }
 


  describe "POST create" do
    before do
      sign_in user
    end
    it 'should increase the number of Item by 1' do
      expect{post :create, item: {name: Faker::StarWars.character, user: user } }.to change(Item,:count).by(1)
    end

    it 'should redirect to the user profile show view' do
      post :create, item: {name: Faker::StarWars.character, user: user}
      expect(response).to redirect_to(root_path)
    end
  end

  describe "DELETE destroy" do
    before do
      sign_in user
    end
    it 'should delete the item' do
      delete :destroy, id: item.id
      expect(Item.count).to eq 0
    end

    it 'should redirect to the user profile show view' do
      delete :destroy, id: item.id
      expect(response).to redirect_to(root_path)
    end
  end

  describe "PUT update" do
    before do
      sign_in user
    end
    it 'should update item with completed = true' do
      put :update, id: item.id, item: {completed: true}
      item.reload
      expect(item.completed).to be true
    end
  end

end

