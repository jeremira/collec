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

  describe "Per week days" do
    describe "#on_monday" do
      let(:opening1) { create :opening, day: Day.monday }
      let(:opening2) { create :opening, day: Day.wednesday }
      it "find relevant day" do
        expect(opening1.on_monday).to be true
      end
      it "reject other day" do
        expect(opening2.on_monday).to be false
      end
    end
    describe "#on_tuesday" do
      let(:opening1) { create :opening, day: Day.tuesday }
      let(:opening2) { create :opening, day: Day.thursday }
      it "find relevant day" do
        expect(opening1.on_tuesday).to be true
      end
      it "reject other day" do
        expect(opening2.on_tuesday).to be false
      end
    end
    describe "#on_wednesday" do
      let(:opening1) { create :opening, day: Day.wednesday }
      let(:opening2) { create :opening, day: Day.saturday }
      it "find relevant day" do
        expect(opening1.on_wednesday).to be true
      end
      it "reject other day" do
        expect(opening2.on_wednesday).to be false
      end
    end
    describe "#on_thursday" do
      let(:opening1) { create :opening, day: Day.thursday }
      let(:opening2) { create :opening, day: Day.monday }
      it "find relevant day" do
        expect(opening1.on_thursday).to be true
      end
      it "reject other day" do
        expect(opening2.on_thursday).to be false
      end
    end
    describe "#on_friday" do
      let(:opening1) { create :opening, day: Day.friday }
      let(:opening2) { create :opening, day: Day.wednesday }
      it "find relevant day" do
        expect(opening1.on_friday).to be true
      end
      it "reject other day" do
        expect(opening2.on_friday).to be false
      end
    end
    describe "#on_saturday" do
      let(:opening1) { create :opening, day: Day.saturday }
      let(:opening2) { create :opening, day: Day.tuesday }
      it "find relevant day" do
        expect(opening1.on_saturday).to be true
      end
      it "reject other day" do
        expect(opening2.on_saturday).to be false
      end
    end
    describe "#on_sunday" do
      let(:opening1) { create :opening, day: Day.sunday }
      let(:opening2) { create :opening, day: Day.saturday }
      it "find relevant day" do
        expect(opening1.on_sunday).to be true
      end
      it "reject other day" do
        expect(opening2.on_sunday).to be false
      end
    end
  end
end
