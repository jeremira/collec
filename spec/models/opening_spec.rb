require 'rails_helper'

RSpec.describe Opening, type: :model do
  let(:opening) {create :opening}
  describe "validation" do
    it "has a valid factory" do
      expect(opening).to be_valid
    end
    it "require a start time" do
      opening.start_at = nil
      expect(opening).not_to be_valid
    end
    it "require an end time" do
      opening.end_at = nil
      expect(opening).not_to be_valid
    end
  end
end
