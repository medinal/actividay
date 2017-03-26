class Post < ApplicationRecord

  validates :challenge_id, presence: true

  belongs_to :challenge
end
