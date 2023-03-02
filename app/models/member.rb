class Product < ActiveRecord::Base
    has_many :assets
    has_many :categories, through: :assets
end