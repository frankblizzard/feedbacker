// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function () {
	 calculateSizes();
	 $(window).resize(function () {
		 calculateSizes();
	 });
	
});


initializeSurveyAnswers = function () {
	$('.survey .answer_link').each(function () {
		
		$(this).click(function () {
			
			$(this).find('.give_answer').slideToggle();
			
		});
		
		
	});
}

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
		$('#planhoursshowhide').text('add category plan hours');
		planhrs = 0;
	} else{
		$('#plan_hours_show_hide').slideDown();
		$('#planhoursshowhide').text('hide');
		planhrs = 1;
	}
}
userplanhrsShowHide = function () {
	if (usrplanhrs == 1) {
		$('#user_plan_hours_show_hide').slideUp();
		$('#userplanhoursshowhide').text('add user plan hours');
		usrplanhrs = 0;
	} else{
		$('#user_plan_hours_show_hide').slideDown();
		$('#userplanhoursshowhide').text('hide');
		usrplanhrs = 1;
	}
}
fixedcostsShowHide = function () {
	if (fixcosts == 1) {
		$('#fixed_costs_show_hide').slideUp();
		$('#fixedcostsshowhide').text('add fixed costs');
		fixcosts = 0;
	} else{
		$('#fixed_costs_show_hide').slideDown();
		$('#fixedcostsshowhide').text('hide');
		fixcosts = 1;
	}
}
triggerCalculation = function () {
	if (calculation == 1) {
		$('#calculation').slideUp();
		$('#calculation_trigger').text('show calculation');
		calculation = 0;
	} else{
		$('#calculation').slideDown();
		$('#calculation_trigger').text('hide');
		calculation = 1;
	}
}