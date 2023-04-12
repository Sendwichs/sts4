/**
 * 
 */

$(function() {
	// 초기이미지
	$("#myimg").attr("src","../image/1.jpg");
	
	// 이벤트
	$("#myimg").hover(function() {
		$(this).attr("src","../image/2.jpeg");
	},function(){
		$(this).attr("src","../image/3.jpeg");
		
	})
	
})