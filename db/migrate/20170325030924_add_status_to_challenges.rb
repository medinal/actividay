class AddStatusToChallenges < ActiveRecord::Migration[5.0]
  def change
    add_column :challenges, :status, :integer, default: 0
  end
end