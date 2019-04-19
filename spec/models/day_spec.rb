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

  describe ".week_day_names" do
    context "by default" do
      let(:on_test) {Day.week_day_names}

      it "return an Array" do
        expect(on_test).to be_an Array
      end
      it "return week days name from sunday" do
        expect(on_test).to eq ["sunday", "monday", "tuesday", "wednesday", "thursday", "friday", "saturday"]
      end
    end
    context "from monday" do
      let(:on_test) {Day.week_day_names(from: 1)}

      it "return an Array" do
        expect(on_test).to be_an Array
      end
      it "return week days name from monday" do
        expect(on_test).to eq ["monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"]
      end
    end
    context "from saturday" do
      let(:on_test) {Day.week_day_names(from: 6)}

      it "return an Array" do
        expect(on_test).to be_an Array
      end
      it "return week days name from monday" do
        expect(on_test).to eq ["saturday", "sunday", "monday", "tuesday", "wednesday", "thursday", "friday"]
      end
    end
    context "from far far away" do
      let(:on_test) {Day.week_day_names(from: 15)}

      it "return an Array" do
        expect(on_test).to be_an Array
      end
      it "return week days name from monday" do
        expect(on_test).to eq ["monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"]
      end
    end
  end
end
