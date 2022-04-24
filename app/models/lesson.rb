class Lesson < ApplicationRecord
  belongs_to :section
  has_one_attached :video
  has_one_attached :thumbnail
  has_many_attached :documents

  # Validates presence of minimum data for a lesson
  validates :title, :content, :section_id, presence: { message: "doit être renseigné" }
  # Validates title length and uniqueness within a section
  validates :title, uniqueness: { scope: :section_id, message: ' est déjà utilisé pour une leçon de cette section' }
  validates :title, length: { in: 10..100, message: ' doit contenir entre 10 et 100 caractères' }, on: :create
  
  # Validates content length
  validates :content, length: { minimum: 150, message: ' doit contenir au moins 150 caractères' }, on: :create
  
  # Validates presence of video OR url
  validates :video, attached: { message: 'doit être uploadée si aucune URL saisie' }, if: :video_and_url_empty?
  validates :url, presence: {message: 'ne peut être vide si aucune vidéo uploadée'} , if: :video_and_url_empty?
  
  def video_and_url_empty?
    video.attached? == false && url.blank?
  end
  
  # Validates documents format, size and presence in non-empty lesson
  validates :documents, content_type: { in: %w[application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document application/vnd.ms-excel application/vnd.openxmlformats-officedocument.spreadsheetml.sheet application/vnd.ms-powerpoint application/vnd.openxmlformats-officedocument.presentationml.presentation], message: 'aux extensions acceptées: .pdf, .doc, .docx, .xls, .xlsx, .ppt, .pptx' }
  validates :documents, size: { less_than: 10.megabytes, message: ' est trop volumineux' }
  
  # Validates thumbnail content type and size
  validates :thumbnail, content_type: { in: %w[image/jpeg image/png image/svg], message: ' aux extensions .jpg, .jpeg, .png et .svg acceptées' }
  validates :thumbnail, size: { less_than: 5.megabytes, message: ' est trop volumineuse' }
end
