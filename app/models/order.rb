class Order < ApplicationRecord
  
  has_many :orderlines
  has_many :pizzas, through: :orderlines
  
end
