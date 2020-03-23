$(function($){
  $('.user-page-tabs--tab').click(function(){
    $('.is-active').removeClass('is-active');
    $(this).addClass('is-active');
    $('.is-show').removeClass('is-show');
    let index = $(this).index();
    $('.notification-container').eq(index).addClass('is-show');
  });
});


$(function($){
  $('.transaction__tabs--tab').click(function(){
    $('.is-active-two').removeClass('is-active-two');
    $(this).addClass('is-active-two');
    $('.is-show-two').removeClass('is-show-two');
    let index = $(this).index();
    $('.transaction__log--message').eq(index).addClass('is-show-two');
  });
});