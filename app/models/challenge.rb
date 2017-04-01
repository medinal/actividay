class Challenge < ApplicationRecord
  enum status: { unchosen: 0, chosen: 1, posted: 2, not_interested: 3, dormant: 4, expired: 5 }
  belongs_to :user
  belongs_to :activity
  has_one :post

  validates_presence_of :user
  validates_presence_of :activity

  delegate :title, to: :activity, prefix: true

  NOTICES = {
    posted: "You can't give up on a challenge you've posted to.",
    unchosen: "You've accepted a challenge! Go get 'em!",
    chosen: "Maybe next time!"
  }

  def self.notice(status)
    NOTICES[status.to_sym]
  end

  def next_status
    @next_status ||= Challenge.statuses.invert[Challenge.statuses[status] + 1]
  end

end
