class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage_payer
  belongs_to :prefecture
  belongs_to :Preparation_days

  belongs_to :user
end
