class Pizza < ApplicationRecord
  
  has_many :orderlines
  has_many :orders, through: :orderlines
  
end
