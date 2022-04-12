class Training < ApplicationRecord
  belongs_to :user
  has_many :sections, dependent: :destroy

  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 500 }
end
