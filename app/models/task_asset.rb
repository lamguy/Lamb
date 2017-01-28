class TaskAsset < ApplicationRecord
  belongs_to :task
  belongs_to :user

  # Paperclip
  has_attached_file :file,
    :styles => {
      :thumb=> "100x100#",
      :small  => "150x150>",
      :medium => "300x300>",
      :large =>   "400x400>" }
  validates_attachment :file, content_type: { content_type: ["image/jpg", "image/jpeg",     "image/png", "image/gif"] }

  attr_accessor :file_file_name
end
