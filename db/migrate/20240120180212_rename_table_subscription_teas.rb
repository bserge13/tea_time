class RenameTableSubscriptionTeas < ActiveRecord::Migration[7.1]
  def change
    rename_table :tea_subscriptions, :subscription_teas
  end
end
