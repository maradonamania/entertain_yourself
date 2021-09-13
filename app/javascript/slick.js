$(function() {
  $('.current-user-image-box').slick({
      dots: true, 
      autoplay: true, 
      autoplaySpeed: 4000, 
      slidesToShow: 3,   

      responsive: [{
        breakpoint: 850, 
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