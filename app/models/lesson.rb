class Lesson < ApplicationRecord
  belongs_to :section
  has_one_attached :video
  has_one_attached :thumbnail
  has_many_attached :documents

  # Validates presence of minimum data for a lesson
  validates :title, :content, :section_id, presence: { message: "Doit être renseigné" }
  # Validates title length and uniqueness within a section
  validates :title, uniqueness: { scope: :section_id, message: 'Ce titre est déjà utilisé pour une leçon de cette section' }
  validates :title, length: { in: 10..100, message: 'Le titre doit contenir entre 10 et 100 caractères' }, on: :create
  
  # Validates content length
  validates :content, length: { minimum: 150, message: 'Le contenu doit contenir au moins 150 caractères' }, on: :create
  
  # Validates presence of video OR url
  validates :video, :url, presence: { message: 'Veuillez uploader une vidéo ou renseigner une url Youtube' }, if: :video_and_url_empty?
  
  def video_and_url_empty?
    video.attached? == false && url.blank?
  end
  
  # Validates documents format, size and presence in non-empty lesson
  validates :documents, content_type: { in: %w[application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document application/vnd.ms-excel application/vnd.openxmlformats-officedocument.spreadsheetml.sheet application/vnd.ms-powerpoint application/vnd.openxmlformats-officedocument.presentationml.presentation], message: 'Seules les extensions .pdf, .doc, .docx, .xls, .xlsx, .ppt, .pptx sont acceptées' }
  validates :documents, size: { less_than: 10.megabytes, message: 'Votre document est trop volumineux' }
  
  # Validates thumbnail content type and size
  validates :thumbnail, content_type: { in: %w[image/jpeg image/png image/svg], message: 'Seules les extensions .jpg, .jpeg, .png et .svg sont acceptées' }
  validates :thumbnail, size: { less_than: 5.megabytes, message: 'Votre image est trop volumineuse' }
end
