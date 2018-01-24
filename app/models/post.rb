class Post < ActiveRecord::Base

  validates :model_id, presence: true

  belongs_to :model

  validates :image, presence: true

  validates :caption, length: { minimum: 3, maximum: 300 }

  has_attached_file :image, styles: { :medium => "640x" }

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  has_many :comments, dependent: :destroy

end