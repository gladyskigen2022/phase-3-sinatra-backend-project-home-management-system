class Member < ActiveRecord::Base
    has_many :assets
    has_many :categories, through: :assets
end