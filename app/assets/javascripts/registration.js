$(function(){
  let buildHTML = (password) => {
    let html = `<div class="password-check__list">
                  <input id="checkbox" type="checkbox" value="">
                  <label class="check__list--box" for="checkbox">
                  ${password}
                  </label>
                </div>`;
      return html;
  }
  $('#user_password').on('keyup', function(e){
    let password = $(this).val();
    $('.icon-check').on('click', function(e){
      let input = password
      $('.password-check__list').remove();
      $('.password-check').append(buildHTML(input));
    })
  })
})