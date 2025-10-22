function srhToggle(obj){
	$("header").removeClass("menu").addClass("fixed").toggleClass("search");
}

function menuToggle(obj){
	$("header").removeClass("search").addClass("fixed").toggleClass("menu");
	if( $("header").hasClass("fixed") == true ){
		
	}
}

function menuClose(){
	$("header").removeClass("menu");
}

function popupOpen(){
	$("html, body, .popup").addClass("fixed");
}

function popupClose(){
	$("html, body, .popup").removeClass("fixed");
}

function toTop(){
	$('html, body').stop().animate( { scrollTop : '0' } );
}

$(document).on("click", ".header-gnb button", function(){
	var parents = $(this).closest("li");

	parents.toggleClass("active");
	parents.siblings().removeClass("active");
	parents.find("dl").stop().slideToggle();
	parents.siblings().find("dl").stop().slideUp();
});

$(document).on("click", ".drop-box button", function(){
	var parents = $(this).closest(".drop-box");

	parents.toggleClass("active");
	parents.find("dl").stop().slideToggle();
});

$(document).on("click", ".tab-box a", function(){
	var index = $(this).parent("li").index();

	$(this).parent("li").addClass("active");
	$(this).parent("li").siblings().removeClass("active");
	$(".tab-content-box .tab-content").eq(index).addClass("active");
	$(".tab-content-box .tab-content").eq(index).siblings().removeClass("active");
});

$(document).ready(function(){
	$(".header-gnb").hover(function(){
		if( $("header").hasClass("fixed") == false ){
			$("header").toggleClass("fixed");
		}
	});
});

$(window).scroll(function(){
	var scl = $(this).scrollTop();
	
	if( $("header").hasClass("sub") == false ){
		if( $("header").hasClass("menu") == false && $("header").hasClass("search") == false ){
			if(scl > 0){
				$("header").addClass("fixed");
			}else{
				$("header").removeClass("fixed");
			}
		}
	}
});
