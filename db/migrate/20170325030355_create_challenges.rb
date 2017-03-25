class CreateChallenges < ActiveRecord::Migration[5.0]
  def change
    create_table :challenges do |t|

      t.timestamps

      t.belongs_to :user
      t.belongs_to :activity

    end
  end
end
