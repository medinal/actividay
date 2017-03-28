class Post < ApplicationRecord

  mount_uploader :avatar, AvatarUploader
  validate :avatar_size_validation

  validates :challenge_id, presence: true
  validates_presence_of :title, :content, on: :update
  validates :title, length: {maximum: 255}
  validates :content, length: {maximum: 1000}

  belongs_to :challenge
  has_one :user, :through => :challenge
  has_one :activity, :through => :challenge

  private

  def avatar_size_validation
    errors[:avatar] << "should be less than 5MB" if avatar.size > 5.megabytes
  end

end
