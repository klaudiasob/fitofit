class AddUserReferenceToActivities < ActiveRecord::Migration[6.1]
  def change
    add_reference :activities, :user
  end
end
