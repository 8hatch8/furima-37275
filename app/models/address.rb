class Address < ApplicationRecord
  belongs_to :contract

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
