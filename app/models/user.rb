class User < ActiveRecord::Base
  has_many :statistics
  has_one :github_user
  has_one :stack_user
  has_one :twitter_user
  has_many :github_repos
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name: 'Relationship',
                                   dependent: :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

  # validates :email, presence: true, uniqueness: true
  # validates :full_name,presence: true
  # validates :user_type,presence: true
  validates :user_name,uniqueness: true


  def following?(other_user)
    relationships.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by(followed_id: other_user.id).destroy
  end

  def followers_to_following
    if self.github_user.following > 0
      self.github_user.followers / self.github_user.following
    else
      0
    end
  end

  def avg_user_score
    User.all.sum(:user_score)
  end
end
