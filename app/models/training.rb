class Training < ApplicationRecord
  belongs_to :user
  has_many :sections, dependent: :destroy

  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 500 }

  scope :ordered, -> { order(:created_at => :desc) }

private
  def self.search(search)
    where("title ILIKE :param OR description ILIKE :param", param: "%#{search.downcase}%")
  end
  
end
