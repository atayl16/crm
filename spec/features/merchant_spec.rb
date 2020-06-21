require 'rails_helper'

describe 'navigate' do
  before do
    user = User.create(email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Jon", last_name: "Snow")
    login_as(user, :scope => :user)
    visit merchants_path
  end
  describe 'index' do
    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title of merchants' do
      expect(page).to have_content(/Merchants/)
    end

    it 'has a list of merchants' do
      merchant1 = Merchant.create(
        production_parent_mid: "123123",
        sandbox_parent_mid: "124124",
        company: "Amazing Corp",
        company_nickname: "Amazing",
        main_contact: "John Snow",
        main_contact_email: "john@example.com",
        franchise_or_smb: "franchise",
        has_global_db: true,
        has_memberships: true,
        has_migration: true,
        has_dedicated_infrastructure: false,
        has_enterprise_billing: false,
        notes: "Leverage agile frameworks to provide a robust synopsis for high level overviews. Iterative approaches to corporate strategy foster collaborative thinking to further the overall value proposition. Organically grow the holistic world view of disruptive innovation via workplace diversity and empowerment.",
        rollout_planner_link: "www.google.com",
        project_plan_link: "www.yahoo.com",
        drive_folder_link: "www.msn.com",
        training: "Traditional onboarding with optional paid upgrades for videos or white-labeled docs",
      )
      merchant2 = Merchant.create(
        production_parent_mid: "124123",
        sandbox_parent_mid: "124125",
        company: "Awesome Company",
        company_nickname: "Awesome",
        main_contact: "Jane Snow",
        main_contact_email: "jane@example.com",
        franchise_or_smb: "franchise",
        has_global_db: true,
        has_memberships: false,
        has_migration: true,
        has_dedicated_infrastructure: false,
        has_enterprise_billing: false,
        notes: "Bring to the table win-win survival strategies to ensure proactive domination. At the end of the day, going forward, a new normal that has evolved from generation X is on the runway heading towards a streamlined cloud solution. User generated content in real-time will have multiple touchpoints for offshoring.",
        rollout_planner_link: "www.google.com",
        project_plan_link: "www.yahoo.com",
        drive_folder_link: "www.msn.com",
        training: "On-site training, video training, white labeled job aides, recorded videos for future staff training",
      )
      visit merchants_path
      expect(page).to have_content(/Amazing|Awesome/)
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
