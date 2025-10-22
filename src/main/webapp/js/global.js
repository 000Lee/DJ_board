const $win = $(window);
const $doc = $(document);
const $html = $('html');

const winW = () => $win.width();
const winH = () => $win.height();
const winSh = () => $win.scrollTop();

//calc(var(--vh, 1vh) * 100)
const setCSSVars = () => {
	document.documentElement.style.setProperty('--vh', `${window.innerHeight * 0.01}px`);
	document.documentElement.style.setProperty('--vw', `${window.innerWidth * 0.01}px`);
};
setCSSVars();
window.addEventListener('resize', setCSSVars);

var head = {
	init: function() {
		this.action();
	},
	action: function(){
		const header = $('#header');
		var headPos = 0;

		header.on('mouseenter focusin', '.gnb .adminA', () => {
			if (matchMedia('screen and (min-width:1025px)').matches) $html.addClass('navOn');
		}).on('mouseleave focusout', ".gnb .adminA", () => {
			if (matchMedia('screen and (min-width:1025px)').matches) {
				$html.removeClass('navOn');
			}
		})

		$('#header .mnu').on('click',function(){
			$html.toggleClass('navOn');
		});

		$('#gotop').on('click',function(){
			$html.scrollTo('#wrap',500);
		});

		$win.on('scroll load', function() {
			const sch = $win.scrollTop();
			if (sch === 0) {
				$html.removeClass('fix out in');
			} else if (sch > 50) {
				$html.addClass('fix');
				if (sch > headPos) {
					$html.removeClass('in');
				} else {
					$html.addClass('out in');
				}
			}

			headPos = sch;
		});
	}
};

$doc.ready(() => {
	head.init();
	$('._date').datepicker();

	$(".dateInput").keyup(function() {
		if( this.value.length > 10){
			this.value = this.value.substr(0, 10);
		}
		var val         = this.value.replace(/\D/g, '');
		var original    = this.value.replace(/\D/g, '').length;
		var conversion  = '';
		for(i = 0;i < 2;i ++){
			if (val.length > 4 && i === 0) {
				conversion += val.substr(0, 4) + '-';
				val         = val.substr(4);
			}
			else if(original>6 && val.length > 2 && i===1){
				conversion += val.substr(0, 2) + '-';
				val         = val.substr(2);
			}
		}
		conversion += val;
		this.value = conversion;
	});
});

$win.on('load', () => {
});