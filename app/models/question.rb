class Question < ApplicationRecord
  has_many :choices
  belongs_to :quiz

  has_attached_file :photo,
    :url  => "/assets/questions/:id/photos/:normalized_file_name.:extension",
    :path => ":rails_root/public/assets/questions/:id/photos/:normalized_file_name.:extension"

  validates_attachment :photo,
    :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] }

  Paperclip.interpolates :normalized_file_name do |attachment, style|
    attachment.instance.normalized_file_name
  end

  def normalized_file_name
    "#{self.id}-#{self.title.gsub( /[^a-zA-Z0-9]/, '-').gsub( /^-/, '' ).gsub( /-$/, '' ).downcase}"
  end

end
