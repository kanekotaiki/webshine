class Chat < ApplicationRecord
  belongs_to :user
  has_many :coments, dependent: :destroy
  validates :title, presence: true, length: { maximum: 50 } 
end
