class Notification < ApplicationRecord
  belongs_to :notified_by, class_name: 'Model'
  belongs_to :model
  belongs_to :post

  validates :model_id, :notified_by_id, :post_id, :identifier, :notice_type, presence: true
end
