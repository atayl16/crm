require 'rails_helper'

describe 'navigate' do
  describe 'index' do
    it 'can be reached successfully' do
      visit merchants_path
      expect(page.status_code).to eq(200)
    end

    it 'has a title of merchants' do
      visit merchants_path
      expect(page).to have_content(/Merchants/)
    end
  end

  describe 'creation' do
    before do
      visit new_merchant_path
    end
    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from new form page' do
      fill_in 'Company Name', with: "Awesome Company"
      click_on "Save"

      expect(page).to have_content("Awesome Company")
    end
  end
end