crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", mypages_path
  parent :root
end

crumb :destroy do
  link "ログアウト", mypage_destroy_path
  parent :mypage
end

crumb :profile do
  link "プロフィール", mypage_profile_path
  parent :mypage
end

crumb :identification do
  link "本人情報の登録", mypage_identification_path
  parent :mypage
end

crumb :card do
  link "支払い方法", mypage_card_path
  parent :mypage
end

crumb :card_new do
  link "クレジットカード情報入力", mypage_card_new_path
  parent :card
end

crumb :item do |item|
  link "#{item.name}", item_path(item)
  parent :root
end

crumb :search do |query|
  link "{query}"
  parent :root
end


