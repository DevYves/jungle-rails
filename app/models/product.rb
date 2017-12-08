class Product < ActiveRecord::Base
  belongs_to :product

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true

end
