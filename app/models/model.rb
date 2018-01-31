class Model < ApplicationRecord

  acts_as_voter

  validates :user_name, presence: true, length: { minimum: 4, maximum: 16 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :posts, dependent: :destroy

  has_many :comments, dependent: :destroy

  has_many :notifications, dependent: :destroy

  has_many :messages

  def conversations
  	Conversation.where("sender_id = ? OR recipient_id = ?", self.id, self.id)
  end

  has_attached_file :avatar, styles: { medium: '152x152#' }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
  has_many :followers, through: :follower_relationships, source: :follower

  has_many :following_relationships, foreign_key: :follower_id, class_name: 'Follow'
  has_many :following, through: :following_relationships, source: :following
  
  def follow(model_id)
    following_relationships.create(following_id: model_id)
  end

  def unfollow(model_id)
    following_relationships.find_by(following_id: model_id).destroy
  end
end
