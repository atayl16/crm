class ChangeCompanyTypeName < ActiveRecord::Migration[5.2]
  def change
    rename_column :merchants, :type, :franchise_or_smb
  end
end
