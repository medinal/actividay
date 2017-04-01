class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  extend FriendlyId

  mount_uploader :avatar, AvatarUploader
  validate :avatar_size_validation
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :challenges
  has_many :activities, :through => :challenges
  has_many :posts, :through => :challenges

  friendly_id :name, use: :slugged

  validates :name, :goals, :born_on, :zip, :email, :password, presence: true
  validates :goals, length: {maximum: 255}
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates_datetime :born_on, date: true
  validates :born_on, date: { before: DateTime.now }

  # helpful link: http://stackoverflow.com/questions/5613410/how-to-display-ages-instead-of-dates-of-birth-in-ruby-on-rails
  def age
    today = Date.today
    d = Date.new(today.year, self.born_on.month, self.born_on.day)
    age = d.year - self.born_on.year - (d > today ? 1 : 0)
  end

  def todays_challenges
    # TODO use a scope: Challenge.today...
    challenges.where("created_at > ?", 1.day.ago)
              .where.not(:status => :not_interested)
              .order(activity_id: :desc)
  end

  private

  # source: http://stevenyue.com/blogs/validate-attachment-file-size-and-type-in-rails/
  def avatar_size_validation
    errors[:avatar] << "should be less than 5MB" if avatar.size > 5.megabytes
  end

  def not_string
      errors[:born_on] << "How did you do that?" if born_on.instance_of? String
  end

end
