class AddIdentifierUrlToUsers < ActiveRecord::Migration
  def change
    add_column :users, :identifier_url, :string
  end
end
