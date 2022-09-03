class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  scope :all_except, -> (user) {where.not(id: user)}
  has_many :messages
  has_one_attached :avatar
  after_commit :add_default_avatar , on: %i[create update]

  private
  def add_default_avatar
    return if avatar.attached?
      avatar.attach(
        io: file.open(Rails.root.join('app', 'assets', 'imges','default_avatar.png')),
        file_name: 'default_avatar.png',
        content_type: 'image/png'
      )
  end

end
