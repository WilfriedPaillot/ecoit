class UtSection < ApplicationRecord
  belongs_to :userTraining
  has_many :uts_lessons
end
