class Topic < ApplicationRecord
  has_many :myshines, dependent: :destroy
  belongs_to :user
  validates :title, presence: true, length: { maximum: 50 }
  
end
