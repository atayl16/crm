class CreateMerchants < ActiveRecord::Migration[5.2]
  def change
    create_table :merchants do |t|
      t.integer :production_parent_mid
      t.integer :sandbox_parent_mid
      t.string :company
      t.string :company_nickname
      t.string :main_contact
      t.string :main_contact_email
      t.string :type
      t.boolean :has_global_db
      t.boolean :has_memberships
      t.boolean :has_migration
      t.boolean :has_dedicated_infrastructure
      t.boolean :has_enterprise_billing
      t.text :notes
      t.string :rollout_planner_link
      t.string :project_plan_link
      t.string :drive_folder_link
      t.string :training

      t.timestamps
    end
  end
end
