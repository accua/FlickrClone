class Picture < ApplicationRecord
  has_many :tags
  has_many :users, :through => :tags
  has_many :comments
  has_many :users, through: :comments

  has_attached_file :local_pic, styles: { full: '800x800>', thumb: '100x100#' }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :local_pic, :content_type => /\Aimage\/.*\Z/
end
