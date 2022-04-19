class Lesson < ApplicationRecord
  belongs_to :section
  has_one_attached :video
  has_one_attached :thumbnail
  has_many_attached :documents
end
