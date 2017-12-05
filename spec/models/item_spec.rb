require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:user) { create(:user) }
  let(:item) { create(:item) }


  it { is_expected.to belong_to(:user) }

  describe "attributes" do
    it 'should have a name attribute' do
      expect(item).to have_attributes(name: item.name)
    end
  end  
end