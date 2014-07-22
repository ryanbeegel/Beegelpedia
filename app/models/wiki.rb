class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborators

  mount_uploader :image, ImageUploader

  default_scope { order('created_at DESC') }
  scope :visible_to, -> (user) { (user && user.premium?) ? Wiki.all : Wiki.public}
  scope :public, -> { where("private IS NOT NULL or private = ?", false) }

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :user, presence: true
end