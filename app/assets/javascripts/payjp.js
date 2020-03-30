document.addEventListener(
  "DOMContentLoaded", e => {
    if (document.getElementById("token_submit") != null) {
      Payjp.setPublicKey("pk_test_27cf234a6a05a9d4aa2a1c56");
      let btn = document.getElementById("token_submit");
      btn.addEventListener("click", e => {
        e.preventDefault();
        let card = {
          number: document.getElementById("card_number").value,
          cvc: document.getElementById("cvc").value,
          exp_month: document.getElementById("exp_month").value,
          exp_year: document.getElementById("exp_year").value
        }; 
        Payjp.createToken(card, (status, response) => {
          if (status === 200) { 
            $("#card_number").removeAttr("name");
            $("#cvc").removeAttr("name");
            $("#exp_month").removeAttr("name");
            $("#exp_year").removeAttr("name"); 
            $("#card_token").append(
              $('<input type="hidden" name="payjp-token">').val(response.id)
            ); 
            document.inputForm.submit();
            alert("登録が完了しました"); 
          } else {
            alert("カード情報が正しくありません。"); 
          }
        });
      });
    }
  },
  false
);

$(function () {
  searchImage = function(){

    $('.card-form').on('keyup',function() {
      targetText = $(this).val();
      console.log(targetText)
      // 検索対象となるリストに入力された文字列が存在するかどうかを判断
      if (targetText.slice(0,1) == 4 && String(targetText).length == 16) {
        console.log("visa");
        //.emptyで小要素を削除
        $('.signup-card-list').empty()
        //.appendで対応する画像のみ追加
        $('.signup-card-list').append(`<img src="/images/visa.png" width="60px" height="40px" class="card-list-image">`)
      } else if (targetText.slice(0,1) == 5 && String(targetText).length == 16) {
        $('.signup-card-list').empty()
        $('.signup-card-list').append(`<img src="/images/master.png" width="60px" height="40px" class="card-list-image">`)
      }   else if (targetText.slice(0,1) == 3 && String(targetText).length == 15) {
        $('.signup-card-list').empty()
        $('.signup-card-list').append(`<img src="/images/amex.png" width="60px" height="40px" class="card-list-image">`)
      } else if (targetText.slice(0,1) == 3 && String(targetText).length == 14) {
        $('.signup-card-list').empty()
        $('.signup-card-list').append(`<img src="/images/diners_club.png" width="60px" height="40px" class="card-list-image">`)
      } else if (targetText.slice(0,1) == 3 && String(targetText).length == 16) {
        $('.signup-card-list').empty()
        $('.signup-card-list').append(`<img src="/images/jcb.png" width="60px" height="40px" class="card-list-image">`)
      } else if (targetText.slice(0,1) == 6 && String(targetText).length == 16) {
        $('.signup-card-list').empty()
        $('.signup-card-list').append(`<img src="/images/discover.png" width="60px" height="40px" class="card-list-image">`)
      } else {
      }
    });
  };

  // searchImageの実行
  $('.card-form').on('input', searchImage);
});
