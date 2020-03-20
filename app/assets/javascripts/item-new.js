// カテゴリーを３段階で選択するためのjQuery
$(function(){

  // selectタグ内に挿入するoptionタグを作成する（子要素、孫要素どちらも作成可能）
  function appendOption(category){
    let html = `<option value="${category.id}">${category.name}</option>`;
    return html;
  }

  // 親カテゴリーが選択された時に、子要素のselectタグを作成し挿入する
  function appendChidren(insertHTML){
      let childrenSelectHtml = '';
      childrenSelectHtml = `
          <select class="item-select-form form-color" id="children-category" required>
            <option value="">選択してください</option>
            ${insertHTML}
          </select>`
      $('#category-form').append(childrenSelectHtml);
  }

  // 子カテゴリーが選択された時に、孫要素のselectタグを作成し挿入する
  function appendGrandchidren(insertHTML){
    let grandchildrenSelectHtml = '';
    grandchildrenSelectHtml = `
        <select class="item-select-form form-color" name="item[category_id]" id="grandchildren-category" required>
          <option value="">選択してください</option>
          ${insertHTML}
        </select>`
    $('#category-form').append(grandchildrenSelectHtml);
}


  // 1つ目のselectタグ（親カテゴリー）選択イベント
  $('#parents-category').on('change',function(e){
    e.preventDefault()
    let input = $(this).val();
    if(input === ""){
      $('#children-category').remove();
      $('#grandchildren-category').remove();
    } else if(input >= 0){
      $.ajax({
        type: 'GET',
        url: '/categories/get_children',
        data: { parent_id: input },
        dataType: 'json'
      })
      .done(function(children){
        $('#children-category').remove();
        $('#grandchildren-category').remove();
        let insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChidren(insertHTML);
      })
      .fail(function() {
        alert("メッセージ送信に失敗しました");
      });
    } else {
      alert("予期せぬ動作です。コードを確認してください。");
    }
  });

  // 2つ目のselectタグ（子カテゴリー）選択イベント
  $('#category-form').on('change', '#children-category', function(e){
    e.preventDefault()
    let input = $(this).val();
    if(input === ""){
      $('#grandchildren-category').remove();
    } else if(input.match(/.+/)){
      $.ajax({
        type: 'GET',
        url: '/categories/get_grandchildren',
        data: { child_id: input },
        dataType: 'json'
      })
      .done(function(grandchildren){
        $('#grandchildren-category').remove();
        let insertHTML = '';
        grandchildren.forEach(function(grandchild){
          insertHTML += appendOption(grandchild);
        });
        appendGrandchidren(insertHTML);
      })
      .fail(function() {
        alert("メッセージ送信に失敗しました");
      });
    } else {
      alert("予期せぬ動作です。コードを確認してください。");
    }
  });

  // -----カテゴリーのエラーハンドリング-----

  // 各階層のchange回数を定義
  let changeNum = {
    parents      : 0,
    children     : 0,
    grandchildren: 0
  }
  $('#parents-category').on('change', function(){
    changeNum["parents"] += 1;
  });
  $('#category-form').on('change', '#children-category', function(){
    changeNum["children"] += 1;
  });
  $('#category-form').on('change', '#grandchildren-category', function(){
    changeNum["grandchildren"] += 1;
  });

  $('#category-form').on({  //動的に生成された要素にhoverは効かないので、onを使う
    'mouseenter': function() {
      $(this).css('border','2px solid #3CCACE');
    },
    'mouseleave': function() {
      let inputId = $(this).val();
      let idName = $(this).attr('id');
      let type = idName.slice(0,-9);
      if(inputId.match(/\d+/)){
        $(this).css('border','1px solid lightslategray');
      } else if(inputId === "") {
        if(changeNum[type] >= 1){
          $(this).css('border','2px solid rgb(255,80,80)');
        } else if(changeNum[type] === 0) {
          $(this).css('border','1px solid lightslategray');
        } else {
          alert("無効です");
        }
      } else {
        alert("無効です");
      }
    }
  },'#parents-category, #children-category, #grandchildren-category');
});





// 配送料の負担者によって配送方法を選択させるjQuery
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
        <select class="item-select-form" name="item[delivery_method_id]" id="item_delivery_method_id" required><option value="">選択してください</option>
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
        <select class="item-select-form" name="item[delivery_method_id]" id="item_delivery_method_id" required><option value="">選択してください</option>
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

// 入力した金額によって販売手数料、販売利益を表示する
$(function(){
  $('#price-form').on('keyup', function(e){
    // e.preventDefault();
    let price = $(this).val();
    if(price < 300 || price >9999999){
      $('#commission').text('ー');
      $('#profit').text('ー');
    } else if(300 <= price <= 9999999){
      let calcCommission = Math.floor(price / 10);
      let commission = calcCommission.toLocaleString();
      let profit = (price - calcCommission).toLocaleString();
      $('#commission').text(`¥ ${commission}`);
      $('#profit').text(`¥ ${profit}`);
    }
  })
});

// 300以上9999999以下で入力してください 赤文字