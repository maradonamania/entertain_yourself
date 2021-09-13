$(function() {
  $('.current-user-image-box').slick({
      dots: true, 
      autoplay: true, 
      autoplaySpeed: 4000, 
      slidesToShow: 3,   

      responsive: [{
        breakpoint: 850, //画面幅768pxで以下のセッティング
        settings: {
          slidesToShow: 2,
          slidesToScroll: 2,
        }
      }, {

        breakpoint: 580,
        settings: {
          slidesToShow: 1,
          slidesToScroll: 2,
          dots: true,
      }
      }]
  });
});