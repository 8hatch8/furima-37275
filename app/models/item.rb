class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage_payer
  belongs_to :prefecture
  belongs_to :Preparation_days

  belongs_to :user
  has_one_attached :image

  validates :name,                presence: true
  validates :text,                presence: true
  validates :price,               numericality: {
                                    only_integer: true,
                                    greater_than_or_equal_to: 300,
                                    less_than_or_equal_to: 9999999
                                  }
  validates :category_id,         numericality: { other_than: 0 }
  validates :condition_id,        numericality: { other_than: 0 }
  validates :postage_payer_id,    numericality: { other_than: 0 }
  validates :prefecture_id,       numericality: { other_than: 0 }
  validates :preparation_days_id, numericality: { other_than: 0 }
  validate  :image_attached
  
  private

  def image_attached
    unless image.attached?
      errors.add(:image, "can't be blank")
    end
  end

end
