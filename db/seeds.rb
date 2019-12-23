require "csv"
CSV.foreach('db/csv/main_data.csv',headers: true) do |row|
 MainCategoty.create!(name: row["name"])
end
CSV.foreach('db/csv/sub_data.csv',headers: true) do |row|
 SubCategory.create!(name: row["name"],main_categoty_id: row["main_categoty_id"] )
end
CSV.foreach('db/csv/sub2_data.csv',headers: true) do |row|
 Sub2Category.create!(name: row["name"],sub_category_id: row["sub_category_id"] )
end