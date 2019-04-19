require 'rails_helper'

RSpec.describe Opening, type: :model do
  let(:opening) {create :opening}
  describe "validation" do
    it "has a valid factory" do
      expect(opening).to be_valid
    end
  end
end
