class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborators

  mount_uploader :image, ImageUploader

  default_scope { order('created_at DESC') }

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :user, presence: true
end