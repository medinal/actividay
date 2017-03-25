class Challenge < ApplicationRecord
  enum status: { unchosen: 0, chosen: 1, not_interested: 2 }
  belongs_to :user
  belongs_to :activity
end
