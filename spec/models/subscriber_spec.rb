require 'rails_helper'

RSpec.describe Subscriber, type: :model do
  let(:subscriber) {
    FactoryBot.create(:subscriber, product: FactoryBot.create(:product))
  }

  context "with valid attributes" do
    it "with valid attributes" do
      expect(subscriber).to be_valid
    end
  end
end
