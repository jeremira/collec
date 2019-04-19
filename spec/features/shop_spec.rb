require "rails_helper"

RSpec.describe "Shops opening time", type: :feature do
  let(:my_shop) {create :shop}

  context "no shop are found" do
    it "is really sorry about that" do
      visit shop_path
      expect(page).to have_content "Sorry, no shop were found."
    end
  end

  context "with a shop" do
    context "and openings" do
      xit "is quite open" do
        visit shop_index_page
        expect(page).to have_content "Opening time for #{my_shop.name}"
        within "#monday_openings_section" do
          expect(page).to have_content "Monday : 10:30-15:00, 17:00-20:00"
        end
        within "#tuesday_openings_section" do
          expect(page).to have_content "Tuesday : 08:00-22:00"
        end
        within "#wednesday_openings_section" do
          expect(page).to have_content "Wednesday : 10:30-15:00, 14:00-14:30, 17:00-20:00"
        end
        within "#thursday_openings_section" do
          expect(page).to have_content "Thursday : Closed"
        end
        within "#friday_openings_section" do
          expect(page).to have_content "Friday : 10:30-11:00, 22:00-00:00"
        end
        within "#saturday_openings_section" do
          expect(page).to have_content "Saturday : Closed"
        end
        within "#sunday_openings_section" do
          expect(page).to have_content "Sunday : 09:00-20:00, 10:30-15:00"
        end
      end
    end
    context "but no openings" do
      it "is always close" do
        visit shop_path
        expect(page).to have_content "Opening time for #{my_shop.name}"
        within "#monday_openings_section" do
          expect(page).to have_content "Monday : Closed"
        end
        within "#tuesday_openings_section" do
          expect(page).to have_content "Tuesday : Closed"
        end
        within "#wednesday_openings_section" do
          expect(page).to have_content "Wednesday : Closed"
        end
        within "#thursday_openings_section" do
          expect(page).to have_content "Thursday : Closed"
        end
        within "#friday_openings_section" do
          expect(page).to have_content "Friday : Closed"
        end
        within "#saturday_openings_section" do
          expect(page).to have_content "Saturday : Closed"
        end
        within "#sunday_openings_section" do
          expect(page).to have_content "Sunday : Closed"
        end
      end
    end
  end
end
