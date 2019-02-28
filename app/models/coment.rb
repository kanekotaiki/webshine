class Coment < ApplicationRecord
  belongs_to :user
  belongs_to :chat
  validates :content, presence: true, length: { maximum: 150 }
end
