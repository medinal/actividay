class Challenge < ApplicationRecord
  enum status: { unchosen: 0, chosen: 1, posted: 2, not_interested: 3, dormant: 4, expired: 5 }
  belongs_to :user
  belongs_to :activity
  has_one :post
end
