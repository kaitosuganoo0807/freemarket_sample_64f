$(function() {
  $('.slider').not('.slick-initialized').slick({
      prevArrow:'.slick-prev',
      nextArrow:'.slick-next',
      dots: true,
      autoplay: true,
      autoplaySpeed: 3000,
      speed: 800
  });

  $('.slick-dots li').on('mouseover', function() {
    $('.slider').slick('goTo', $(this).index());
  });
});
