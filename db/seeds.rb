require "csv"

Product.destroy_all
Category.destroy_all

csv_file = Rails.root.join("db", "products.csv")

CSV.foreach(csv_file, headers: true, encoding: "bom|utf-8") do |row|
  category = Category.find_or_create_by!(
    name: row["category"]
  )

  Product.create!(
    title: row["name"],
    price: row["price"],
    description: row["description"],
    stock_quantity: row["stock quantity"],
    category: category
  )
end

puts "Created #{Category.count} categories."
puts "Created #{Product.count} products."
