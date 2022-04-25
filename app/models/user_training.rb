class UserTraining < ApplicationRecord
  belongs_to :user
  belongs_to :training
  has_many :ut_sections, dependent: :destroy
  has_many :sections, through: :ut_sections

  # Validates presence of minimum data for a user_training
  validates :user_id, :training_id, presence: { message: "doit être renseigné" }, on: :create
  validates :user_id, uniqueness: { scope: :training_id, message: ' est déjà inscrit à ce cours' }, on: :create

  # Validates presence and completion rate
  validates :completion_rate, presence: { message: "doit être renseigné" }
  validates :completion_rate, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100, message: "doit être un nombre entier compris entre 0 et 100" }

end
