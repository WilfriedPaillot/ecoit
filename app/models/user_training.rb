class UserTraining < ApplicationRecord
  belongs_to :user
  belongs_to :training
  has_many :ut_sections
end
