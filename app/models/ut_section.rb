class UtSection < ApplicationRecord
  belongs_to :user_training
  has_many :uts_lessons
end
