/* global $ */

$(document).on("turbolinks:load", function(){
      $('.slider').bxSlider();
});
    
   
$(function() {
	$('.rule').click( function () {
		$('#sampleModal').modal();
	});
});



$(document).ready(function() {
  // popupクラスを持つ要素にMagnific Popupを適用
  $(".popup").magnificPopup({
    type: "image",
    gallery: {
      enabled: true,
    },
    
  });
});