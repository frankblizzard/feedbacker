// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function () {
	 calculateSizes();
	 $(window).resize(function () {
		 calculateSizes();
	 });
	
     $('#project_user_tokens').tokenInput('/users.json', { 
															crossDomain: false,
															prePopulate: $('#project_user_tokens').data('pre'),
															theme: 'facebook'  
															});  
  $('#bg_fix').jrumble({
	rumbleEvent: 'hover',
	rumbleSpeed: 90
  });	
});

calculateSizes = function () {
	 //$(".main").height($(window).height()-$('.header').height());
	 $(".right_side").width($(window).width()-$('.left_side').width());
	 $(".header .news").width($(window).width()-607);
}