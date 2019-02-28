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
  // animatedクラスの付いた要素にwaypointを登録
  $(".sannpuru").waypoint({
  	handler: function(direction) {
      // 要素が画面中央に来るとここが実行される
      if (direction === "down") { // 下方向のスクロール
        // イベント発生元の要素にfadeInUpクラスを付けることで
        // アニメーションを開始
        $(".title").addClass("zoomIn");
        $(".setumei").addClass("zoomIn");
        $(".setumei2").addClass("zoomIn");
        $(".setumei3").addClass("zoomIn");
        $(".setumei4").addClass("zoomIn");
        // waypointを削除することで、この要素に対しては
        // これ以降handlerが呼ばれなくなる
        
      }
  	},
    offset: "70%"
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