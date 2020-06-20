require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe "Creation" do
    before do
      @merchant = Merchant.create(production_parent_mid: "123", company: "Awesome Corp")
    end

    it 'can be created' do
      expect(@merchant).to be_valid
    end

    it 'cannot be created without a company name' do
      @merchant.company = nil
      expect(@merchant).to_not be_valid
    end
  end
end
