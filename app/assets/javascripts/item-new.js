$(function(){

  var buildHTML = function(input){
    if(input == 1){
      var html = 
      `
      <div class="exhibit-box__main__delivery__methodbox__text">
        <h3 class="bold-text">配送の方法</h3>
        <p class="require-text">必須</p>
      </div>
      <div class="exhibit-box__main__delivery__methodbox__form">
        <select class="item-select-form" name="item[delivery_method_id]" id="item_delivery_method_id"><option value="">選択してください</option>
          <option value="1">未定</option>
          <option value="2">らくらくFURIMA便</option>
          <option value="3">ゆうメール</option>
          <option value="4">レターパック</option>
          <option value="5">普通郵便（定形、定形外）</option>
          <option value="6">シロネコヤマト</option>
          <option value="7">ゆうパック</option>
          <option value="8">クリックポスト</option>
          <option value="9">ゆうパケット</option>
        </select>
      </div>`
    } else if(input == 2){
      var html = 
      `
      <div class="exhibit-box__main__delivery__methodbox__text">
        <h3 class="bold-text">配送の方法</h3>
        <p class="require-text">必須</p>
      </div>
      <div class="exhibit-box__main__delivery__methodbox__form">
        <select class="item-select-form" name="item[delivery_method_id]" id="item_delivery_method_id"><option value="">選択してください</option>
          <option value="1">未定</option>
          <option value="2">シロネコヤマト</option>
          <option value="3">ゆうメール</option>
          <option value="4">ゆうパック</option>
        </select>
      </div>`
    } else{
    };
    return html;
  }
  $('#item_delivery_charge_id').on('change', function(e){
    var input = $(this).val();
    var html = buildHTML(input);
    $('.exhibit-box__main__delivery__methodbox__text').remove();
    $('.exhibit-box__main__delivery__methodbox__form').remove();
    $('.delivery-method-area').append(html);
  });
});