require "rails_helper"

RSpec.describe "Shops opening time", type: :feature do
  let!(:open_shop)  {create :shop}
  let!(:close_shop) {create :shop}
  let(:monday) {create :monday}
  let(:tuesday) {create :tuesday}
  let(:wednesday) {create :wednesday}
  let(:thursday) {create :thursday}
  let(:friday) {create :friday}
  let(:saturday) {create :saturday}
  let(:sunday) {create :sunday}
  let!(:opening1) { create :opening, shop: open_shop, day: monday, start_at: "10h30", end_at: "15h00"}
  let!(:opening2) { create :opening, shop: open_shop, day: monday, start_at: "17h00", end_at: "20h00"}
  let!(:opening3) { create :opening, shop: open_shop, day: tuesday, start_at: "08h00", end_at: "22h00"}
  let!(:opening4) { create :opening, shop: open_shop, day: wednesday, start_at: "10h30", end_at: "15h00"}
  let!(:opening5) { create :opening, shop: open_shop, day: wednesday, start_at: "14h00", end_at: "14h30"}
  let!(:opening6) { create :opening, shop: open_shop, day: wednesday, start_at: "17h00", end_at: "20h00"}
  let!(:opening7) { create :opening, shop: open_shop, day: friday, start_at: "10h30", end_at: "11h00"}
  let!(:opening8) { create :opening, shop: open_shop, day: friday, start_at: "22h00", end_at: "00h00"}
  let!(:opening9) { create :opening, shop: open_shop, day: sunday, start_at: "09h00", end_at: "20h00"}
  let!(:opening10) { create :opening, shop: open_shop, day: sunday, start_at: "10h30", end_at: "15h00"}

  describe "Week days rotation" do
    context "Starting on a sunday" do
      before :each do
        allow(Time.zone).to receive(:now) {Time.parse("Sun, 21 Apr 2019 15:14:24 UTC +00:00")}
      end
      it "display week days starting from sunday" do
        visit shop_path(close_shop.id)
        expect(page).to have_content "Opening time for #{close_shop.name}"
        expect(page).to have_content /Sunday.*Monday.*Tuesday.*Wednesday.*Thursday.*Friday.*Saturday/
      end
    end

    context "Starting on a Wednesday" do
      before :each do
        allow(Time.zone).to receive(:now) {Time.parse("Wed, 17 Apr 2019 15:14:24 UTC +00:00")}
      end
      it "display week days starting from Wednesday" do
        visit shop_path(close_shop.id)
        expect(page).to have_content "Opening time for #{close_shop.name}"
        expect(page).to have_content /Wednesday.*Thursday.*Friday.*Saturday.*Sunday.*Monday.*Tuesday/
      end
    end

    context "Starting on a Monday" do
      before :each do
        allow(Time.zone).to receive(:now) {Time.parse("Mon, 8 Apr 2019 15:14:24 UTC +00:00")}
      end
      it "display week days starting from Monday" do
        visit shop_path(close_shop.id)
        expect(page).to have_content "Opening time for #{close_shop.name}"
        expect(page).to have_content /Monday.*Tuesday.*Wednesday.*Thursday.*Friday.*Saturday.*Sunday/
      end
    end
  end

  scenario "Open shop" do
    visit shop_path(open_shop.id)
    expect(page).to have_content "Opening time for #{open_shop.name}"
    within "#monday-openings-block" do
      expect(page).to have_content "Monday : 10:30-15:00 17:00-20:00"
    end
    within "#tuesday-openings-block" do
      expect(page).to have_content "Tuesday : 08:00-22:00"
    end
    within "#wednesday-openings-block" do
      expect(page).to have_content "Wednesday : 10:30-15:00 14:00-14:30 17:00-20:00"
    end
    within "#thursday-openings-block" do
      expect(page).to have_content "Thursday : Closed"
    end
    within "#friday-openings-block" do
      expect(page).to have_content "Friday : 10:30-11:00 22:00-00:00"
    end
    within "#saturday-openings-block" do
      expect(page).to have_content "Saturday : Closed"
    end
    within "#sunday-openings-block" do
      expect(page).to have_content "Sunday : 09:00-20:00 10:30-15:00"
    end
  end

  scenario "Close shop" do
    visit shop_path(close_shop.id)
    expect(page).to have_content "Opening time for #{close_shop.name}"
    within "#monday-openings-block" do
      expect(page).to have_content "Monday : Closed"
    end
    within "#tuesday-openings-block" do
      expect(page).to have_content "Tuesday : Closed"
    end
    within "#wednesday-openings-block" do
      expect(page).to have_content "Wednesday : Closed"
    end
    within "#thursday-openings-block" do
      expect(page).to have_content "Thursday : Closed"
    end
    within "#friday-openings-block" do
      expect(page).to have_content "Friday : Closed"
    end
    within "#saturday-openings-block" do
      expect(page).to have_content "Saturday : Closed"
    end
    within "#sunday-openings-block" do
      expect(page).to have_content "Sunday : Closed"
    end
  end
end
