/*#######################################################
#	파일명	:	jQuery.slide.js	(슬라이드뷰)			#
#  버 전     :   ver 1.2											#
#	설	명		:	슬라이드 이미지 구현 							#
#	작성자	:	박용길 (트위터 : @tabler47)				#
#	일	자	    :	2012-01-17									#
#  라이센스 :   라이센스 없습니다. 힘들게 구현하는 웹개발자분들을 위해  오픈합니다. 
                     잘 만든 것은 아니지만 도움이 되었으면 합니다. 작성자와 버전은 삭제하지 말아 주세요..^^
#  2012-03-30 : Line 59. 
						이 라인의 slidesContainer id를 직접작성하지 않고 DOM 트리로 가져오도록 변경
						$(this).find('#slidesContainer') => $(this).find('div:first-child')
#######################################################*/
(function ($) {

	$.fn.slideView = function(settings){

		var cfg = {
			slideDebug:false,									//디버깅 모드 사용여부
			viewWidth:240,										//슬라이드 view 영역의 가로사이즈
			viewHeight:150,										//슬라이드 view 영역의 세로사이즈
			viewElementLength:1,								//슬라이드에 보여질 LI element의 개수
			viewElementPadding:0,							//슬라이드 element의 좌우 여백 사이즈
			slideObjClass:'slideLI',								//슬라이드 개별 element class name
			slideTempContainer:'slideContainer',			//내부 생성 container div
			slideClickDirectionBtn:'right',					//슬라이드 방향: 방향에 대한 버튼 종류 (우측버튼:left, 좌측버튼:right)
			slideLoop:true,										//슬라이드 반복 여부
			slideAutoplay:true,									//슬라이드 자동 실행 여부
			slideInterval:1500,									//슬라이드 timer 시간
			slideBtnLeft:'btnSlideLeft',						//왼쪽 슬라이드 요청 버튼
			slideBtnRight:'btnSlideRight',					//오른쪽 슬라이드 요청 버튼
			slideAnimateTime:400,								//에니메이션 효과의 속도
		};

		if(settings) $.extend(cfg,settings);					//property에 대한 사용자 값 확장

		this.each(function(){
			//###### property ######
			var _SlideView = this;															//slide wrapper div
			var _SlideLi = $(_SlideView).find('.'+cfg.slideObjClass);			//slide 개별 element
			var _SlideSize = _SlideLi.length;											//slide 개별 element의 갯수
			var _curPosition = 0;															//현재 위치에 대한 flag
			var _SlideTimer = "";															//slide timer 객체
			var _clickLeftFlag = false;													//좌측 버튼 클릭 시 event실행 flag
			var _clickRightFlag = false;													//우측 버튼 클릭 시 event실행 flag
			var _LastBtnCheckNum = _SlideSize - cfg.viewElementLength;	//마지막 버튼의 비활성화 비교 숫자
			var _wrapWidth = (cfg.viewWidth+cfg.viewElementPadding*2)*_SlideSize;		//wrapper의 가로 사이즈 변경(여백포함)
			var _containerWidth = (cfg.viewWidth+cfg.viewElementPadding*2)*cfg.viewElementLength - (cfg.viewElementPadding*2);

			//###### initialize ######
			if(cfg.slideDebug){
				$('body').before('<div id="_dbg" style="width:50%;height:20px;border:1px solid blue;"></div>');
			}
//			_dbg(_wrapWidth);
			if(cfg.viewElementPadding!=0){
				$(_SlideLi).css({"padding-left":cfg.viewElementPadding+"px","padding-right":cfg.viewElementPadding+"px"});
			}
			//wrapper & container의 width값

			$(this).find('div:first-child').css({"width":_containerWidth,"height":cfg.viewHeight});

		//## 임시 slide wrapper 생성 시작 ##
			if( navigator.appVersion.indexOf("MSIE 9") > -1 ){
				div = document.createElement("DIV");
				div.id = cfg.slideTempContainer;

				$(_SlideLi).wrapAll(div).css({'width' : cfg.viewWidth, 'height': cfg.viewHeight});	//기본 사이즈로 wrapper 지정
			}else{
				$(_SlideLi).wrapAll('<div id="'+cfg.slideTempContainer+'"></div>').css({'width' : cfg.viewWidth, 
					'height': cfg.viewHeight});
			}		

			var _Wrapper = $('#'+cfg.slideTempContainer);					//wrapper 변수 할당
			$(_Wrapper).css('width', _wrapWidth);			//전체 slide li의 element 크기만큼 wrapper 사이즈 변경
			$(_Wrapper).css('marginLeft', -cfg.viewElementPadding);
			//## 임시 slide wrapper 생성 종료##

			$(_SlideLi).css({'float':'left'});	//하위 li element를 가로로 float시킴
		
			//slide li element에 사용자 속성지정(index) => 현재 위치의 li element를 구분하기 위한 기능
			$.each(_SlideLi,function(index){
				$(this).attr('val',index);
			});

			//_dbg(tmp);

			//slideLoop가 false(loop이 허용되지 않고)이고 slideAutoplay가 false(자동 실행이 아닌 수동 클릭일 경우)일 경우
			fnChkButton();

			//###### function ######
			//자동 슬라이드 시작
			function fnAutoStart(){
				if(cfg.slideAutoplay){			//자동 play일 경우
					_SlideTimer = window.setInterval(function(){
						fnSlide();
					},cfg.slideInterval);
				}
			}
			//자동 슬라이드 정지
			function fnAutoStop(){
				if(cfg.slideAutoplay){			//자동 play일 경우
					window.clearInterval(_SlideTimer);
				}
			}
			//슬라이드 실행
			function fnSlide(){
				_curPosition ++;	
				
				if(cfg.slideClickDirectionBtn=="right"){				//왼쪽 이동 일 경우
					//1. 슬라이드 효과 적용(marginLeft값을 Li element사이즈 만큰 - 이동
					//2. wrapper의 marginLeft값을 0으로 변경 후 사라진 Li element를 wrapper의 뒤로 이동
					//3. 버튼의 사용 유무 체크 함수 호출
					$(_Wrapper).animate({
						'marginLeft' : cfg.viewWidth * (-_curPosition) - (cfg.viewElementPadding * 3)
					},cfg.slideAnimateTime,function(){
							$(_Wrapper).css('marginLeft',-cfg.viewElementPadding);
							$(_Wrapper).find('div:first-child').insertAfter($(_Wrapper).find('div:last-child'));	
							_curPosition = 0;
							fnChkButton();
						}
					);
				}else if(cfg.slideClickDirectionBtn=="left"){		//오른쪽 이동일 경우
					//1. Li element중 마지막 element를 wrapper의 앞으로 이동
					//2. wrapper의 marginLeft를 Li element의 width값 만큼 좌로 수정
					//3. 슬라이드 효과 적용 (좌로 Li element 만큼 이동한 width값을 우측으로 이동)
					//4. 버튼의 사용 유무 체크 함수 호출
					$(_Wrapper).find('div:last-child').insertBefore($(_Wrapper).find('div:first-child'));	
					$(_Wrapper).css('marginLeft',-(cfg.viewWidth+cfg.viewElementPadding*3));
					_curPosition = 0;

					$(_Wrapper).animate({
						'marginLeft' : cfg.viewWidth * _curPosition - cfg.viewElementPadding 
					},cfg.slideAnimateTime,function(){
							fnChkButton();
						});
				}
				
			}
			//왼쪽버튼 클릭에 대한 함수
			function fnLeftClick(){
				if(_clickLeftFlag){
					cfg.slideClickDirectionBtn = "left";
					fnSlide();
				}
			}
			//오른쪽 버튼 클릭에 대한 함수
			function fnRightClick(){
				if(_clickRightFlag){
					cfg.slideClickDirectionBtn = "right";
					fnSlide();
				}
			}
			//왼쪽 버튼에 대한 활성/비활성 효과	/*#### 사용자 수정 가능 함수 ####*/
			function fnChkBtnViewLeft(){
				if(_clickLeftFlag){
					$('#'+cfg.slideBtnLeft).css("border","");
				}else{
					$('#'+cfg.slideBtnLeft).css("border","1px solid red");
				}
			}
			//오른쪽 버튼에 대한 활성/비활성 효과 /*#### 사용자 수정 가능 함수 ####*/
			function fnChkBtnViewRight(){
				if(_clickRightFlag){
					$('#'+cfg.slideBtnRight).css("border","");
				}else{
					$('#'+cfg.slideBtnRight).css("border","1px solid red");
				}
			}

			// animation 효과 이후의 버튼의 사용 유무
			function fnChkButton(){
				//자동 실행이 아닐 경우 
				if(!cfg.slideAutoplay){

					_clickLeftFlag = true;
					_clickRightFlag = true;
					fnChkBtnViewLeft();	//버튼 활성/비활성 여부에 따른 UI효과
					fnChkBtnViewRight();	//버튼 활성/비활성 여부에 따른 UI효과

					if(!cfg.slideLoop){	//반복이 아닐 경우 좌/우 버튼에 비활성화 효과
						if($(_Wrapper).find('div:first-child').attr('val')==0){			//첫번째 Li element일 경우 좌측 버튼의 비활성화
							_clickLeftFlag = false;
							fnChkBtnViewLeft();	//버튼 활성/비활성 여부에 따른 UI효과
						}else if($(_Wrapper).find('div:first-child').attr('val')==(_LastBtnCheckNum)){	//마지막 Li element일 경우 우측 버튼의 비활성화
							_clickRightFlag = false;
							//_dbg(_SlideSize+" : "+viewElementLength);
							fnChkBtnViewRight();	//버튼 활성/비활성 여부에 따른 UI효과
						}
					}
				}else{	//자동 실행일 경우 좌/우 버튼 display : none
					$('#'+cfg.slideBtnLeft).css("display","none");
					$('#'+cfg.slideBtnRight).css("display","none");
				}
			}


			//debug 함수 가동
			function _dbg(str){
				if(cfg.slideDebug){
					$('#_dbg').text(str);
				}
			}

			//###### event ######//
			if(!cfg.slideAutoplay){				//자동 play가 아닐 경우
				//왼쪽버튼 클릭
				$('#'+cfg.slideBtnLeft).bind('click',fnLeftClick);
				//오른쪽 버튼 클릭
				$('#'+cfg.slideBtnRight).bind('click',fnRightClick);
			}				
			//wrapper 마우스 오버 및 아웃일 경우 autoplay stop/start
			$(_SlideLi).hover(function(){
					fnAutoStop();
				},function(){
					fnAutoStart();
				}
			);

			if(cfg.slideAutoplay) fnAutoStart();


		
		});

		return this;

	};
	

}) (jQuery);