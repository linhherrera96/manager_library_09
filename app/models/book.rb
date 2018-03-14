class Book < ApplicationRecord
  belongs_to :author

  has_many :like, dependent: :destroy
  has_many :borrows_detail, dependent: :destroy
  has_many :book_follow, dependent: :destroy
  has_many :comment, dependent: :destroy
  has_many :rating, dependent: :destroy

  validates :name, presence: true
  scope :sort_by_alphabet, ->{order(name: :asc)}
  mount_uploader :picture, PictureUploader
  validate :picture_size

  private

  def picture_size
    errors.add :picture, t("model.book.picture_size") if picture.size > Settings.book.picture_size.megabytes
  end
end
