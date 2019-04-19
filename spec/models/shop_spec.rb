require 'rails_helper'

RSpec.describe Shop, type: :model do
  let(:shop) {create :shop}

  describe "validation" do
    it "has a valid factory" do
      expect(shop).to be_valid
    end
  end
end
