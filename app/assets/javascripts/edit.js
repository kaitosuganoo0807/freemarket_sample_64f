$(function () {
  
  let image_obj = $(".sell-box");
  let drop_zone = $(".drop-zone");
  // debugger;
  for(let i = 0; i < image_obj.length; i++){
    // 出品画面で登録した枚数分、アップロードするエリアが表示されてしまうため、一つのエリアだけ残し、非表示を行う。
    if (i != 0){
      image_obj.eq(i).addClass(".sell-box-none");
      drop_zone.eq(i).remove();
      // ドラッグ＆ドロップエリアのゾーンは削除を行う。
      // image_objを非表示ではなく、削除してしまうと、「下記の削除ボタンが押下された場合」の処理に影響が出てしまうため、削除はしない。
    }
  };

  // 出品画像の削除ボタンが押下された場合
  let target_obj = ".preview-box__select--delete p"
  $(target_obj).on("click", function(){
    let index = $(this).attr("data-index");
    let check_box = $(`[id *= ${index}__destroy]`);
    check_box.prop("checked", true);


    ipb_none = "image-preview-box-none";
    // 画像と画像の間のスペースを削除する。
    let space = $("preview-box__select--delete");
    space.filter(function(){
      let space_index = $(this).attr("data-space");
      if (space_index === index){
        $(this).addClass(ipb_none);
      }
    });
    
    $(this).parents(".image-preview-box").addClass(ipb_none);
  });
});