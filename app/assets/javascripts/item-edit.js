$(document).ready(function(){
  $(function(){

    //プレビューのhtmlを定義
    function buildHTML(count) {
      var html = `
                  <li class="preview-box" id="preview-box__${count}">
                    <div class="main-box">
                      <img data-index="${count}" width="100" height="100" src="">
                    </div>
                    <div class="lower-box">
                      <div class="update-box"></div>
                        <label for="item_images_attributes_${count}_image">
                          <div class="edit-btn">編集</div>
                        </label>
                    <div class="delete-box" id="delete_btn_${count}"></div>
                      <label for="item_images_attributes_${count}__destroy">
                        <div class="delete-btn">削除</div>
                      </label>
                    </div>
                  </li>`
      return html;
    }

    $(`.hidden-content`).hide();

    // 投稿編集時
    if (window.location.href.match(/\/items\/\d+\/edit/)){
      //登録済み画像のプレビュー表示欄の要素を取得する
      var prevContent = $('.label-content').prev();
      $('.preview-box').each(function(index, box){
        $(box).attr('id', `preview-box__${index}`);
      })
      //削除ボタンにidを追加
      $('.delete-box').each(function(index, box){
        $(box).attr('id', `delete_btn_${index}`);
      })
      var count = $('.preview-box').length;
    }

    // ラベルのwidth操作
    function setLabel() {
      var prevContent = $('.label-content').prev();
    }

    // プレビューの追加
    $(document).on('change', '.hidden-field', function() {
      //hidden-fieldのidの数値のみ取得
      var id = $(this).attr('id').replace(/[^0-9]/g, '');
      //labelボックスのidとforを更新
      $('.label-box').attr({id: `label-box--${id}`,for: `item_images_attributes_${id}_image`});
      //選択したfileのオブジェクトを取得
      var file = this.files[0];
      var reader = new FileReader();
      //readAsDataURLで指定したFileオブジェクトを読み込む
      reader.readAsDataURL(file);
      //読み込み時に発火するイベント
      reader.onload = function() {
        var image = this.result;
        //プレビューが元々なかった場合はhtmlを追加
        if ($(`#preview-box__${id}`).length == 0) {
          var count = $('.preview-box').length;
          var html = buildHTML(id);
          //ラベルの直前のプレビュー群にプレビューを追加
          var prevContent = $('.label-content').prev();
          $(prevContent).append(html);
        }
        //イメージを追加
        $(`#preview-box__${id} img`).attr('src', `${image}`);
        var count = $('.preview-box').length;
        
        if (count == 10) {
          alert('画像は10枚までです');
          $(`.label-content`).hide();
        }

        //プレビュー削除したフィールドにdestroy用のチェックボックスがあった場合、チェックを外す
        if ($(`#item_images_attributes_${id}__destroy`)){
          $(`#item_images_attributes_${id}__destroy`).prop('checked',false);
        } 

        //ラベルのwidth操作
        setLabel();
        //ラベルのidとforの値を変更
        if(count < 11){
          $('.label-box').attr({id: `label-box--${count}`,for: `item_images_attributes_${count}_image`});
        }
      }
    });
    
    // 画像の削除
    $(document).on('click', '.hidden-checkbox', function(e) {
      var count = $('.preview-box').length;
      console.log(count)
      setLabel(count);
      var id = $(this).attr('id').replace(/[^0-9]/g, '');
      $(`#preview-box__${id}`).remove();
      //新規登録時と編集時の場合分け

      //新規投稿時
      //削除用チェックボックスの有無で判定
      if ($(`#item_images_attributes_${id}__destroy`).length == 0) {
        //フォームの中身を削除 
        $(`#item_images_attributes_${id}_image`).val("");
        var count = $('.preview-box').length;
        setLabel(count);
        if(id < 11){
          $('.label-box').attr({id: `label-box--${id}`,for: `item_images_attributes_${id}_image`});
        }
      } else {
        //投稿編集時
        $(`#item_images_attributes_${id}__destroy`).prop('checked',true);
        if (count == 10) {
          $('.label-content').show();
        }
        if (count == 1) {
          alert('画像を入力してください');
          event.stopPropagation();
          return false;
        }
        //ラベルのwidth操作
        setLabel();
        //ラベルのidとforの値を変更
        //削除したプレビューのidによって、ラベルのidを変更する
        if(id < 11){
          $('.label-box').attr({id: `label-box--${id}`,for: `item_images_attributes_${id}_image`});
        }
      }
    });
  });
});