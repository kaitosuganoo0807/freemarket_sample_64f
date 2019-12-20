$(function() {
  var form = $("#charge-form");
  Payjp.setPublicKey('pk_test_3aa0a86fd415f84602de8d62'); //(自身の公開鍵)

  $("#charge-form").on("click", "#token_submit", function(e) {
    console.log("fire1");
    e.preventDefault();
    form.find("input[type=submit]").prop("disabled", true);
    var card = {
        number: parseInt($("#number").val()),
        cvc: parseInt($("#cvc").val()),
        exp_month: parseInt($("#exp_month").val()),
        exp_year: parseInt($("#exp_year").val())
        
    };
    console.log(card);


    Payjp.createToken(card, function(status, response) {
                console.log("fire2");
                if (status === 200) { //成功した場合
                  $("#number").removeAttr("name");
                  $("#cvc").removeAttr("name");
                  $("#exp_month").removeAttr("name");
                  $("#exp_year").removeAttr("name"); //データを自サーバにpostしないように削除
                  $("#token_submit").append(
                    $('<input type="hidden" name="payjp-token">').val(response.id)
                  ); //取得したトークンを送信できる状態にします
                  console.log(response.id);
                  $("#charge-form").get(0).submit();
                  // document.inputForm.submit();
                  alert("登録が完了しました"); //確認用
                } else {
                  alert("カード情報が正しくありません。"); //確認用
                }
              });
  });
});