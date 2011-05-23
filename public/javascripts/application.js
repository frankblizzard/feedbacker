// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function () {
	 calculateSizes();
	 $(window).resize(function () {
		 calculateSizes();
	 });
	
});

calculateSizes = function () {
	 //$(".main").height($(window).height()-$('.header').height());
	 $(".right_side").width($(window).width()-$('.left_side').width());
	 $(".header .news").width($(window).width()-607);
//   $('#bg_fix').jrumble({
//   rumbleEvent: 'hover',
//   rumbleSpeed: 90
// });
}

commentsShowHide = function () {
	if (comments == 1) {
		$('#comments').slideUp();
		$('#new_comment').hide();
		$('#showhide').text('show');
		comments = 0;
	} else{
		$('#comments').slideDown();
		$('#new_comment').show();
		$('#showhide').text('hide');
		comments = 1;
	};	
}

planhrsShowHide = function () {
	if (planhrs == 1) {
		$('#plan_hours_show_hide').slideUp();
		$('#planhoursshowhide').text('add plan hours');
		planhrs = 0;
	} else{
		$('#plan_hours_show_hide').slideDown();
		$('#planhoursshowhide').text('hide');
		planhrs = 1;
	};	
}