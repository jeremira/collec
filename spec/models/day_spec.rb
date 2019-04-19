require 'rails_helper'

RSpec.describe Day, type: :model do
  let(:day) {create :day}
  let(:dup_day) {build :day, order: day.order}
  let(:empty_day) {build :day, order: nil}
  let(:monday) {create :monday}
  let(:tuesday) {create :tuesday}
  let(:wednesday) {create :wednesday}
  let(:thursday) {create :thursday}
  let(:friday) {create :friday}
  let(:saturday) {create :saturday}
  let(:sunday) {create :sunday}
  let(:eighteday) {build :day, order: 7}

  describe "validation" do
    it "has a valid factory" do
      expect(day).to be_valid
    end
    it "require an order" do
      expect(empty_day).not_to be_valid
    end
    it "require an unic order" do
      expect(dup_day).not_to be_valid
    end
    it "monday exist" do
      expect(monday).to be_valid
    end
    it "tuesday exist" do
      expect(tuesday).to be_valid
    end
    it "wednesday exist" do
      expect(wednesday).to be_valid
    end
    it "thursday exist" do
      expect(thursday).to be_valid
    end
    it "friday exist" do
      expect(friday).to be_valid
    end
    it "saturday exist" do
      expect(saturday).to be_valid
    end
    it "sunday exist" do
      expect(sunday).to be_valid
    end
    it "eighteday dont exist" do
      expect(eighteday).not_to be_valid
    end
  end

  describe "week days scopes" do
    context "with no day" do
      it "there is a monday" do
        expect(Day.monday).to be_a Day
        expect(Day.monday.order).to eq 0
      end
      it "there is a tuesday" do
        expect(Day.tuesday).to be_a Day
        expect(Day.tuesday.order).to eq 1
      end
      it "there is a wednesday" do
        expect(Day.wednesday).to be_a Day
        expect(Day.wednesday.order).to eq 2
      end
      it "there is no thursday" do
        expect(Day.thursday).to be_a Day
        expect(Day.thursday.order).to eq 3
      end
      it "there is a friday" do
        expect(Day.friday).to be_a Day
        expect(Day.friday.order).to eq 4
      end
      it "there is a saturday" do
        expect(Day.saturday).to be_a Day
        expect(Day.saturday.order).to eq 5
      end
      it "there is a sunday" do
        expect(Day.sunday).to be_a Day
        expect(Day.sunday.order).to eq 6
      end
    end
    context "with days" do
      before :each do
        [monday, tuesday, wednesday, thursday, friday, saturday, sunday]
      end
      it "there is a monday" do
        expect(Day.monday).to be_a Day
        expect(Day.monday.order).to eq 0
      end
      it "there is a tuesday" do
        expect(Day.tuesday).to be_a Day
        expect(Day.tuesday.order).to eq 1
      end
      it "there is a wednesday" do
        expect(Day.wednesday).to be_a Day
        expect(Day.wednesday.order).to eq 2
      end
      it "there is no thursday" do
        expect(Day.thursday).to be_a Day
        expect(Day.thursday.order).to eq 3
      end
      it "there is a friday" do
        expect(Day.friday).to be_a Day
        expect(Day.friday.order).to eq 4
      end
      it "there is a saturday" do
        expect(Day.saturday).to be_a Day
        expect(Day.saturday.order).to eq 5
      end
      it "there is a sunday" do
        expect(Day.sunday).to be_a Day
        expect(Day.sunday.order).to eq 6
      end
    end
  end

  describe "full_name" do
    it "return a string" do
      expect(wednesday.full_name).to be_a String
    end
    it "return correct week day" do
      expect(wednesday.full_name).to eq "wednesday"
    end
  end
end
