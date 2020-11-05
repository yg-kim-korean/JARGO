/*#######################################################
#	���ϸ�	:	jQuery.slide.js	(�����̵��)			#
#  �� ��     :   ver 1.2											#
#	��	��		:	�����̵� �̹��� ���� 							#
#	�ۼ���	:	�ڿ�� (Ʈ���� : @tabler47)				#
#	��	��	    :	2012-01-17									#
#  ���̼��� :   ���̼��� �����ϴ�. ����� �����ϴ� �������ںе��� ����  �����մϴ�. 
                     �� ���� ���� �ƴ����� ������ �Ǿ����� �մϴ�. �ۼ��ڿ� ������ �������� ���� �ּ���..^^
#  2012-03-30 : Line 59. 
						�� ������ slidesContainer id�� �����ۼ����� �ʰ� DOM Ʈ���� ���������� ����
						$(this).find('#slidesContainer') => $(this).find('div:first-child')
#######################################################*/
(function ($) {

	$.fn.slideView = function(settings){

		var cfg = {
			slideDebug:false,									//����� ��� ��뿩��
			viewWidth:240,										//�����̵� view ������ ���λ�����
			viewHeight:150,										//�����̵� view ������ ���λ�����
			viewElementLength:1,								//�����̵忡 ������ LI element�� ����
			viewElementPadding:0,							//�����̵� element�� �¿� ���� ������
			slideObjClass:'slideLI',								//�����̵� ���� element class name
			slideTempContainer:'slideContainer',			//���� ���� container div
			slideClickDirectionBtn:'right',					//�����̵� ����: ���⿡ ���� ��ư ���� (������ư:left, ������ư:right)
			slideLoop:true,										//�����̵� �ݺ� ����
			slideAutoplay:true,									//�����̵� �ڵ� ���� ����
			slideInterval:1500,									//�����̵� timer �ð�
			slideBtnLeft:'btnSlideLeft',						//���� �����̵� ��û ��ư
			slideBtnRight:'btnSlideRight',					//������ �����̵� ��û ��ư
			slideAnimateTime:400,								//���ϸ��̼� ȿ���� �ӵ�
		};

		if(settings) $.extend(cfg,settings);					//property�� ���� ����� �� Ȯ��

		this.each(function(){
			//###### property ######
			var _SlideView = this;															//slide wrapper div
			var _SlideLi = $(_SlideView).find('.'+cfg.slideObjClass);			//slide ���� element
			var _SlideSize = _SlideLi.length;											//slide ���� element�� ����
			var _curPosition = 0;															//���� ��ġ�� ���� flag
			var _SlideTimer = "";															//slide timer ��ü
			var _clickLeftFlag = false;													//���� ��ư Ŭ�� �� event���� flag
			var _clickRightFlag = false;													//���� ��ư Ŭ�� �� event���� flag
			var _LastBtnCheckNum = _SlideSize - cfg.viewElementLength;	//������ ��ư�� ��Ȱ��ȭ �� ����
			var _wrapWidth = (cfg.viewWidth+cfg.viewElementPadding*2)*_SlideSize;		//wrapper�� ���� ������ ����(��������)
			var _containerWidth = (cfg.viewWidth+cfg.viewElementPadding*2)*cfg.viewElementLength - (cfg.viewElementPadding*2);

			//###### initialize ######
			if(cfg.slideDebug){
				$('body').before('<div id="_dbg" style="width:50%;height:20px;border:1px solid blue;"></div>');
			}
//			_dbg(_wrapWidth);
			if(cfg.viewElementPadding!=0){
				$(_SlideLi).css({"padding-left":cfg.viewElementPadding+"px","padding-right":cfg.viewElementPadding+"px"});
			}
			//wrapper & container�� width��

			$(this).find('div:first-child').css({"width":_containerWidth,"height":cfg.viewHeight});

		//## �ӽ� slide wrapper ���� ���� ##
			if( navigator.appVersion.indexOf("MSIE 9") > -1 ){
				div = document.createElement("DIV");
				div.id = cfg.slideTempContainer;

				$(_SlideLi).wrapAll(div).css({'width' : cfg.viewWidth, 'height': cfg.viewHeight});	//�⺻ ������� wrapper ����
			}else{
				$(_SlideLi).wrapAll('<div id="'+cfg.slideTempContainer+'"></div>').css({'width' : cfg.viewWidth, 
					'height': cfg.viewHeight});
			}		

			var _Wrapper = $('#'+cfg.slideTempContainer);					//wrapper ���� �Ҵ�
			$(_Wrapper).css('width', _wrapWidth);			//��ü slide li�� element ũ�⸸ŭ wrapper ������ ����
			$(_Wrapper).css('marginLeft', -cfg.viewElementPadding);
			//## �ӽ� slide wrapper ���� ����##

			$(_SlideLi).css({'float':'left'});	//���� li element�� ���η� float��Ŵ
		
			//slide li element�� ����� �Ӽ�����(index) => ���� ��ġ�� li element�� �����ϱ� ���� ���
			$.each(_SlideLi,function(index){
				$(this).attr('val',index);
			});

			//_dbg(tmp);

			//slideLoop�� false(loop�� ������ �ʰ�)�̰� slideAutoplay�� false(�ڵ� ������ �ƴ� ���� Ŭ���� ���)�� ���
			fnChkButton();

			//###### function ######
			//�ڵ� �����̵� ����
			function fnAutoStart(){
				if(cfg.slideAutoplay){			//�ڵ� play�� ���
					_SlideTimer = window.setInterval(function(){
						fnSlide();
					},cfg.slideInterval);
				}
			}
			//�ڵ� �����̵� ����
			function fnAutoStop(){
				if(cfg.slideAutoplay){			//�ڵ� play�� ���
					window.clearInterval(_SlideTimer);
				}
			}
			//�����̵� ����
			function fnSlide(){
				_curPosition ++;	
				
				if(cfg.slideClickDirectionBtn=="right"){				//���� �̵� �� ���
					//1. �����̵� ȿ�� ����(marginLeft���� Li element������ ��ū - �̵�
					//2. wrapper�� marginLeft���� 0���� ���� �� ����� Li element�� wrapper�� �ڷ� �̵�
					//3. ��ư�� ��� ���� üũ �Լ� ȣ��
					$(_Wrapper).animate({
						'marginLeft' : cfg.viewWidth * (-_curPosition) - (cfg.viewElementPadding * 3)
					},cfg.slideAnimateTime,function(){
							$(_Wrapper).css('marginLeft',-cfg.viewElementPadding);
							$(_Wrapper).find('div:first-child').insertAfter($(_Wrapper).find('div:last-child'));	
							_curPosition = 0;
							fnChkButton();
						}
					);
				}else if(cfg.slideClickDirectionBtn=="left"){		//������ �̵��� ���
					//1. Li element�� ������ element�� wrapper�� ������ �̵�
					//2. wrapper�� marginLeft�� Li element�� width�� ��ŭ �·� ����
					//3. �����̵� ȿ�� ���� (�·� Li element ��ŭ �̵��� width���� �������� �̵�)
					//4. ��ư�� ��� ���� üũ �Լ� ȣ��
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
			//���ʹ�ư Ŭ���� ���� �Լ�
			function fnLeftClick(){
				if(_clickLeftFlag){
					cfg.slideClickDirectionBtn = "left";
					fnSlide();
				}
			}
			//������ ��ư Ŭ���� ���� �Լ�
			function fnRightClick(){
				if(_clickRightFlag){
					cfg.slideClickDirectionBtn = "right";
					fnSlide();
				}
			}
			//���� ��ư�� ���� Ȱ��/��Ȱ�� ȿ��	/*#### ����� ���� ���� �Լ� ####*/
			function fnChkBtnViewLeft(){
				if(_clickLeftFlag){
					$('#'+cfg.slideBtnLeft).css("border","");
				}else{
					$('#'+cfg.slideBtnLeft).css("border","1px solid red");
				}
			}
			//������ ��ư�� ���� Ȱ��/��Ȱ�� ȿ�� /*#### ����� ���� ���� �Լ� ####*/
			function fnChkBtnViewRight(){
				if(_clickRightFlag){
					$('#'+cfg.slideBtnRight).css("border","");
				}else{
					$('#'+cfg.slideBtnRight).css("border","1px solid red");
				}
			}

			// animation ȿ�� ������ ��ư�� ��� ����
			function fnChkButton(){
				//�ڵ� ������ �ƴ� ��� 
				if(!cfg.slideAutoplay){

					_clickLeftFlag = true;
					_clickRightFlag = true;
					fnChkBtnViewLeft();	//��ư Ȱ��/��Ȱ�� ���ο� ���� UIȿ��
					fnChkBtnViewRight();	//��ư Ȱ��/��Ȱ�� ���ο� ���� UIȿ��

					if(!cfg.slideLoop){	//�ݺ��� �ƴ� ��� ��/�� ��ư�� ��Ȱ��ȭ ȿ��
						if($(_Wrapper).find('div:first-child').attr('val')==0){			//ù��° Li element�� ��� ���� ��ư�� ��Ȱ��ȭ
							_clickLeftFlag = false;
							fnChkBtnViewLeft();	//��ư Ȱ��/��Ȱ�� ���ο� ���� UIȿ��
						}else if($(_Wrapper).find('div:first-child').attr('val')==(_LastBtnCheckNum)){	//������ Li element�� ��� ���� ��ư�� ��Ȱ��ȭ
							_clickRightFlag = false;
							//_dbg(_SlideSize+" : "+viewElementLength);
							fnChkBtnViewRight();	//��ư Ȱ��/��Ȱ�� ���ο� ���� UIȿ��
						}
					}
				}else{	//�ڵ� ������ ��� ��/�� ��ư display : none
					$('#'+cfg.slideBtnLeft).css("display","none");
					$('#'+cfg.slideBtnRight).css("display","none");
				}
			}


			//debug �Լ� ����
			function _dbg(str){
				if(cfg.slideDebug){
					$('#_dbg').text(str);
				}
			}

			//###### event ######//
			if(!cfg.slideAutoplay){				//�ڵ� play�� �ƴ� ���
				//���ʹ�ư Ŭ��
				$('#'+cfg.slideBtnLeft).bind('click',fnLeftClick);
				//������ ��ư Ŭ��
				$('#'+cfg.slideBtnRight).bind('click',fnRightClick);
			}				
			//wrapper ���콺 ���� �� �ƿ��� ��� autoplay stop/start
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