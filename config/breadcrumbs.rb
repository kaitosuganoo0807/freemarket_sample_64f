crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", mypages_path
  parent :root
end

crumb :destroy do
  link "ログアウト", mypages_destroy_path
  parent :mypage
end

crumb :profile do
  link "プロフィール", mypages_profile_path
  parent :mypage
end

crumb :identification do
  link "本人情報の登録", mypages_identification_path
  parent :mypage
end

crumb :identification do
  link "本人情報の登録", mypages_identification_path
  parent :mypage
end

crumb :card do
  link "支払い方法", mypages_card_new_path
  parent :mypage
end


