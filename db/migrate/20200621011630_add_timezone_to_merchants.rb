class AddTimezoneToMerchants < ActiveRecord::Migration[5.2]
  def change
    add_column :merchants, :timezone, :string
  end
end
