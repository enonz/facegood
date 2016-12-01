class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :active_relationships, class_name: 'Follow', foreign_key: 'follower_id', dependent: :destroy
  has_many :passive_relationships, class_name: 'Follow', foreign_key: 'followed_id', dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers:[:google_oauth2]
    has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.full_name = auth.info.full_name
        user.birthday = auth.info.birthday
        user.avatar_file_name = auth.info.image
        user.avatar_file_size = 511989
        content_type = auth.info.image
          if (content_type[-3,3] == 'png')
            user.avatar_content_type = 'image/png'
          elsif (content_type[-3,3] == 'jpg')
            user.avatar_content_type = 'image/jpg'
          elsif (content_type[-3,3] == 'gif')
            user.avatar_content_type = 'image/gif'
          end
        user.avatar_updated_at = Time.now
      end
  end

end
