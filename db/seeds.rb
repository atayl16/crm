# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

@user = User.create(email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Jon", last_name: "Snow")
puts "1 User created"

20.times do |merchant|
  Merchant.create!(
    production_parent_mid: Faker::Number.number(digits: 6),
    sandbox_parent_mid: Faker::Number.number(digits: 6),
    company: Faker::Company.name,
    company_nickname: Faker::Company.name,
    main_contact: Faker::Name.name,
    main_contact_email: Faker::Internet.safe_email,
    franchise_or_smb: Faker::Company.industry,
    has_global_db: Faker::Boolean.boolean,
    has_memberships: Faker::Boolean.boolean,
    has_migration: Faker::Boolean.boolean,
    has_dedicated_infrastructure: Faker::Boolean.boolean,
    has_enterprise_billing: Faker::Boolean.boolean,
    notes: Faker::Company.catch_phrase,
    rollout_planner_link: Faker::Internet.url,
    project_plan_link: Faker::Internet.url,
    drive_folder_link: Faker::Internet.url,
    training: Faker::Company.bs,
    timezone: "MST"
  )
end

puts "20 Merchants have been created"
