class AddPhoneCountryCodeToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :phone, :string
    add_column :users, :country_code, :string
  end
 end
 
