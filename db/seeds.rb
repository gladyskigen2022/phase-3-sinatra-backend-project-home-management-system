require_relative '../config/environment'
require 'faker'

puts "🌱 Seeding data..."
60.times do
    Asset.create(
        item_name:Faker::HomeAssets.item_name,
        category:Faker::AssetsTypes.find(rand(1..30)),
        warranty:Faker::WarrantyYears.warranty,
        brand:Faker::HomeEquipmentsBrand.brand,
        price:Faker::rand(15000-200000),
        comment:Faker::BrandComments.brand,
        image:Faker::HomeAssetsImages.HomeAssetPictures,
        category_id:rand(1..Category.count),
        member_id:rand(1..Member.count)
    )
end

    45.times do
    Category.create(
        category_name:Faker::AssetsTypes.asset_group
    )
    end

    5.times do
    Member.create(
        member_name:Faker::UserName.uniqueName
    )
    end
    

# Seed your database here

puts "✅ Done seeding!"
