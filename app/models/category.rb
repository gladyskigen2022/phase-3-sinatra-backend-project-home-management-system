class Category < ActiveRecord::Base
    has_many :assets
    has_many :members, through: :assets
end