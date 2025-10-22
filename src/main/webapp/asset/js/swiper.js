var swiper00 = new Swiper(".swiper00", {
	slidesPerView: 1,
	spaceBetween: 0,
	autoplay: {
		delay: 2500,
		disableOnInteraction: false,
	},
	on: {
		slideChange : function() {
			var idx = this.activeIndex;
			var box =$(".main-wrap-00 .swiper-control ul li").eq(idx);
			box.addClass("active");
			box.siblings("li").removeClass("active");
        },
    },
});

/*var swiper01 = new Swiper(".swiper01", {
	slidesPerView: 3,
	spaceBetween: 25,
	loop: true,
	autoplay: {
		delay: 2500,
		disableOnInteraction: false,
	},
	pagination: {
		el: ".main-wrap-01 .swiper-pagination",
	},
	breakpoints: {
		1600: {
			slidesPerView: 2,
			spaceBetween: 10,
		},
	},
});*/
/** 메인페이지 JIAT POPUP CUSTOM */
var swiper01 = new Swiper(".swiper01", {
	slidesPerView: 1,
	spaceBetween: 300,
	loop: true,
	autoplay: {
		delay: 3500,
		disableOnInteraction: false,
	},
	pagination: {
		el: ".main-wrap-01 .swiper-pagination",
	},
	breakpoints: {
		1000: {
			slidesPerView: 1,
			spaceBetween: 10,
		},
		800: {
			slidesPerView: 1,
			spaceBetween: 20,
		},
	},
});

var swiper02 = new Swiper(".swiper02", {
	slidesPerView: 2,
    spaceBetween: 60,
	loop: true,
	autoplay: {
		delay: 2500,
		disableOnInteraction: false,
	},
	pagination: {
		el: ".main-wrap-02 .swiper-pagination",
		clickable: true,
		renderBullet: function (index, className) {
		  return '<span class="' + className + '">' + (index + 1) + "</span>";
		},
	},
	breakpoints: {
		991: {
			slidesPerView: 1,
			spaceBetween: 15,
		},
	},
	on: {
		slideChange : function() {
			var idx = this.realIndex;
			var box =$(".main-wrap-02 .list-bottom .left-box .inner").eq(idx);
			box.addClass("active");
			box.siblings(".inner").removeClass("active");
			console.log(idx);
        },
    },
});

var swiper03 = new Swiper(".swiper03", {
	slidesPerView: 1,
	loop: true,
	autoplay: {
		delay: 2500,
		disableOnInteraction: false,
	},
	pagination: {
		el: ".main-wrap-07 .swiper-pagination",
		type: "fraction",
	},
	navigation: {
		nextEl: ".main-wrap-07 .swiper-button-next",
		prevEl: ".main-wrap-07 .swiper-button-prev",
	},
	breakpoints: {
		1600: {
			slidesPerView: 2,
			spaceBetween: 15,
		},
		991: {
			slidesPerView: 1,
			spaceBetween: 0,
		},
	},
});

var swiper04 = new Swiper(".swiper04", {
	slidesPerView: 6,
	spaceBetween: 15,
	loop: true,
	autoplay: {
		delay: 2500,
		disableOnInteraction: false,
	},
	pagination: {
		el: ".main-wrap-08 .swiper-pagination",
		type: "fraction",
	},
	navigation: {
		nextEl: ".main-wrap-08 .swiper-button-next",
		prevEl: ".main-wrap-08 .swiper-button-prev",
	},
	breakpoints: {
		1600: {
			slidesPerView: 4,
			spaceBetween: 15,
		},
		991: {
			slidesPerView: 3,
			spaceBetween: 10,
		},
	},
});

function swiperChange(idx){
	swiper00.slideTo(idx);

	if(idx == 0){
		location.href = '/department02.do';
	}else if(idx == 1){
		location.href = '/facility03.do';
	}else if(idx == 2){
		location.href = '/department04.do';
	}
}