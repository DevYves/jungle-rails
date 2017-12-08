class Review < ActiveRecord::Base


    monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true


validates: :product, presence: true
validates: :user, presence: true
validates: :rating, presence: true


  Is a review without a product (parent) valid?
Is a review without a user (reviewer) valid?
Is a review with no description valid?
Is a review with no rating valid?
end
