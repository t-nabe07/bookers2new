class Book < ApplicationRecord

  #attachment :profile_image
  belongs_to :user
  has_many :fovorites, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }

end
