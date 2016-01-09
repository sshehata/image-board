class Photo < ActiveRecord::Base
  belongs_to :user

  has_attached_file :image, styles: {medium: '400x400', thumb: '100x100' },
    url: '/assets/images/:id/:style/:basename.:extension'
  validates_attachment_presence :image
  validates_attachment_content_type :image, content_type: ['image/jpeg', 'image/png']

  validates :user, presence: true
end
