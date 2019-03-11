/* global $ */

$(document).on("turbolinks:load", function(){
      $('.slider').bxSlider();
});
    
   

$(document).ready(function() {
  $('.rule').click( function () {
	  console.log("test")
		$('#sampleModal').modal();
	});
  // popupクラスを持つ要素にMagnific Popupを適用
  $(".popup").magnificPopup({
    type: "image",
    gallery: {
      enabled: true,
    },
  });

    $(".owl-carousel").owlCarousel( {
      loop: true,
      items: 1,
      nav: true
    });
});