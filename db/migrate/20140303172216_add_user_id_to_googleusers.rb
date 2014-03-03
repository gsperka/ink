class AddUserIdToGoogleusers < ActiveRecord::Migration
  def change
    add_reference :googleusers, :user, index: true
  end
end
