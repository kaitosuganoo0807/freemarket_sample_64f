main_categoties = ['レディース','メンズ','ベビー・キッズ','インテリア・住まい・小物','本・音楽・ゲーム','おもちゃ・ホビー・グッズ','コスメ・香水・美容','家電・スマホ・カメラ','スポーツ・レジャー','ハンドメイド','チケット','自動車・オートバイ','その他']
main_categoties.each do |parent|
  MainCategoty.create(name: parent)
end

require "csv"
CSV.foreach('db/csv/main_data.csv',headers: true) do |row|
 MainCategory.create!(name: row["name"])
end
CSV.foreach('db/csv/sub_data.csv',headers: true) do |row|
 SubCategory.create!(name: row["name"],main_category_id: row["main_category_id"] )
end
CSV.foreach('db/csv/sub2_data.csv',headers: true) do |row|
 Sub2Category.create!(name: row["name"],sub_category_id: row["sub_category_id"])
end
