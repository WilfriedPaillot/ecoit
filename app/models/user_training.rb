class UserTraining < ApplicationRecord
  belongs_to :user
  belongs_to :training
  has_many :ut_sections, dependent: :destroy

  validates :user_id          , presence: true
  validates :training_id      , presence: true
  validates :completion_rate  , presence: true, 
    numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
end
