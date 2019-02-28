class Myshine < ApplicationRecord
  belongs_to :user
  belongs_to :topic
  mount_uploader :image, ImageUploader
  validates :image, presence: true
  
  
end
