class Post < ActiveRecord::Base

  validates :model_id, presence: true

  belongs_to :model

  validates :image, presence: true

  has_attached_file :image, styles: { :medium => "640x" }

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end