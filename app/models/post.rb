class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  validates_presence_of :content, message: 'Post tidak boleh kosong'
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
