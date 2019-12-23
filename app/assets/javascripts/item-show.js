$(function(){
  $('.image-sub').click(function(){
    var selectedSrc = $(this).attr('src');
    $('.image').html(`<img src="${selectedSrc}" width="300px" height="300px">`)
  });
});