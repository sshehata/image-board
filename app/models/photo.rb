class Photo < ActiveRecord::Base
  belongs_to :user

  has_attached_file :image, styles: {medium: '640x320', thumb: '100x100' },
    url: '/assets/images/:id/:style/:basename.:extension'
  validates_attachment_presence :image
  validates_attachment_content_type :image, content_type: ['image/jpeg', 'image/png']

  validates :user, presence: true
  validates :title, presence: true

  before_create { 
    self.views = 0
    self.uploaded_on = Time.now.utc
  }

end
