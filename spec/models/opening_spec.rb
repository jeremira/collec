require 'rails_helper'

RSpec.describe Opening, type: :model do
  let(:opening) {create :opening}
  let(:monday) {create :monday}
  let(:tuesday) {create :tuesday}
  let(:wednesday) {create :wednesday}
  let(:thursday) {create :thursday}
  let(:friday) {create :friday}
  let(:saturday) {create :saturday}
  let(:sunday) {create :sunday}

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

  describe "#display_opening_time" do
    let(:opening) {create :opening, start_at: "10h30", end_at: "15h00"}
    let(:on_test) {opening.display_opening_time}

    it "return a string" do
      expect(on_test).to be_a String
    end
    it "return correct time slot format" do
      expect(on_test).to eq "10:30-15:00"
    end
  end

  describe "Per week days" do
    describe "#on_monday" do
      let(:opening1) { create :opening, day: monday }
      let(:opening2) { create :opening, day: wednesday }
      it "find relevant day" do
        expect(opening1.on_monday).to be true
      end
      it "reject other day" do
        expect(opening2.on_monday).to be false
      end
    end
    describe "#on_tuesday" do
      let(:opening1) { create :opening, day: tuesday }
      let(:opening2) { create :opening, day: thursday }
      it "find relevant day" do
        expect(opening1.on_tuesday).to be true
      end
      it "reject other day" do
        expect(opening2.on_tuesday).to be false
      end
    end
    describe "#on_wednesday" do
      let(:opening1) { create :opening, day: wednesday }
      let(:opening2) { create :opening, day: saturday }
      it "find relevant day" do
        expect(opening1.on_wednesday).to be true
      end
      it "reject other day" do
        expect(opening2.on_wednesday).to be false
      end
    end
    describe "#on_thursday" do
      let(:opening1) { create :opening, day: thursday }
      let(:opening2) { create :opening, day: monday }
      it "find relevant day" do
        expect(opening1.on_thursday).to be true
      end
      it "reject other day" do
        expect(opening2.on_thursday).to be false
      end
    end
    describe "#on_friday" do
      let(:opening1) { create :opening, day: friday }
      let(:opening2) { create :opening, day: wednesday }
      it "find relevant day" do
        expect(opening1.on_friday).to be true
      end
      it "reject other day" do
        expect(opening2.on_friday).to be false
      end
    end
    describe "#on_saturday" do
      let(:opening1) { create :opening, day: saturday }
      let(:opening2) { create :opening, day: tuesday }
      it "find relevant day" do
        expect(opening1.on_saturday).to be true
      end
      it "reject other day" do
        expect(opening2.on_saturday).to be false
      end
    end
    describe "#on_sunday" do
      let(:opening1) { create :opening, day: sunday }
      let(:opening2) { create :opening, day: saturday }
      it "find relevant day" do
        expect(opening1.on_sunday).to be true
      end
      it "reject other day" do
        expect(opening2.on_sunday).to be false
      end
    end
  end
end
