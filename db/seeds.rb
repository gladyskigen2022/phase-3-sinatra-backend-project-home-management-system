puts "🌱 Seeding data..."

25.times do
    categoryarray = ["Home_electronics","Furniture","Kitchen","Library"]
    Category.create(
        category_name: categoryarray.sample
        )
end

5.times do
    Member.create(
        member_name:Faker::Name.name
    )
end

60.times do
   # categoryarray = ["Home_electronics","Furniture","Kitchen","Library"]
    Asset.create(
        item_name:Faker::Commerce.product_name,
       # category:Faker::Company.industry,
        date_of_purchase:Date.new,
        warranty:rand(1..7),
        brand:Faker::Company.name,
        price:rand(2500..500000),
        comment:Faker::Lorem.sentence,
        image:Faker::LoremFlickr.image,
        category_id:rand(1..Category.count),
        member_id:rand(1..Member.count)
    )
end


# Seed your database here

puts "✅ Done seeding!"
