require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:product) {
    FactoryBot.create(:product)
  }


  # 正常系
  context "with valid attributes" do
    it 'is valid with a name and inventory count' do
      expect(product).to be_valid
    end

    it 'can create a product with inventory' do
      product = FactoryBot.create(:product, inventory_count: 50)
      expect(product.inventory_count).to eq(50)
    end
  end

  # 異常系
  context 'with invalid attributes' do
    it 's invalid withoud a name' do
      product.name = nil
      expect(product).not_to be_valid
    end
  end
end
