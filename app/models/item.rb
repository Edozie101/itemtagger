class Item < ApplicationRecord
  belongs_to :user
  has_one :qrcode
  has_many_attached :avatar
  

end
