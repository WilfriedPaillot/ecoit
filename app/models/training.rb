class Training < ApplicationRecord
  belongs_to :user
  has_many :sections, dependent: :destroy

  # Validates presence of minimum data for a training
  validates :title, :description, :user_id, presence: { message: "doit être renseigné" }
  # Validates title length and uniqueness for user (insctructor)
  validates :title, uniqueness: { scope: :user_id, message: ' est déjà utilisé pour l\'un de vos cours' }
  validates :title, length: { in: 10..50, message: ' doit contenir entre 10 et 50 caractères' }, on: :create
  # Validates description length
  validates :description, length: { minimum: 50, message: ' doit contenir au moins 50 caractères' }, on: :create

  # Scope for trainings
  scope :ordered_by_title, -> { order(:title => :asc) }
  scope :ordered_by_author, -> { joins(:user).order('users.first_name ASC') }
  scope :ordered_by_created_at, -> { order(:created_at => :desc) }
  scope :ordered_by_updated_at, -> { order(:updated_at => :desc) }

private
  def self.search(search)
    where("title ILIKE :param OR description ILIKE :param", param: "%#{search.downcase}%")
  end
  
end
