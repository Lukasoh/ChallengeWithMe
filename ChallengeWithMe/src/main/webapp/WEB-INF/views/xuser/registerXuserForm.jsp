<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꼬박꼬박 회원가입</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/style.css" type="text/css">
<script type="text/javascript" src="${ pageContext.request.contextPath }/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		let idChecked = 0;
		let nickChecked = 0;
		let emailChecked = 0;
		
		// 아이디 중복체크
		$('#id_check').click(function(){
			if(!/^[A-Za-z0-9]{4,12}$/.test($('#id').val())){
				alert('영문 숫자 포함 4 ~ 12자로 작성해주세요.')
				$('#id').val('').focus()
				return
			}
			
			// 서버 통신
			$.ajax({
				url:'checkDuplicatedId.do',
				type:'post',
				data:{id:$('#id').val()},
				dataType:'json',
				success:function(param){
					if(param.result == 'idNotFound'){
						idChecked = 1
						$('#message_id').css('color', '#000000').text('등록 가능한 ID입니다.')
					}else if(param.result == 'idDuplicated'){
						idChecked = 0
						$('#message_id').css('color', 'red').text('중복된 ID입니다.')
						$('#id').val('').focus()
					}else{
						idChecked = 0
						alert('아이디 중복 체크 오류 발생')
					}
				},
				error:function(){
					idChecked = 0
					alert('네트워크 오류 발생')
				}
			})
		})
			// 닉네임 중복체크
		$('#nick_check').click(function(){
			if(!/^[가-힣A-Za-z0-9]{2,15}$/.test($('#nick').val())){
				alert('한글 영문 숫자 포함 2 ~ 15자로 작성해주세요.')
				$('#nick').val('').focus()
				return
			}
			
			// 서버 통신
			$.ajax({
				url:'checkDuplicatedNick.do',
				type:'post',
				data:{nick:$('#nick').val()},
				dataType:'json',
				success:function(param){
					if(param.result == 'nickNotFound'){
						nickChecked = 1
						$('#message_nick').css('color', '#000000').text('등록 가능한 닉네임입니다.')
					}else if(param.result == 'nickDuplicated'){
						nickChecked = 0
						$('#message_nick').css('color', 'red').text('중복된 닉네임입니다.')
						$('#nick').val('').focus()
					}else{
						nickChecked = 0
						alert('닉네임 중복 체크 오류 발생')
					}
				},
				error:function(){
					nickChecked = 0
					alert('네트워크 오류 발생')
				}
			})
		})
		
		// 이메일 중복체크
		$('#email_check').click(function(){
			// 서버 통신
			$.ajax({
				url:'checkEmail.do',
				type:'post',
				data:{email:$('#email').val()},
				dataType:'json',
				success:function(param){
					if(param.result == 'emailNotFound'){
						emailChecked = 1
						$('#message_email').css('color', '#000000').text('가입 가능한 이메일입니다.')
					}else if(param.result == 'emailDuplicated'){
						emailChecked = 0
						$('#message_email').css('color', 'red').text('이미 가입된 이메일입니다.')
						$('#email').val('').focus()
					}else{
						emailChecked = 0
						alert('이메일 가입 체크 오류 발생')
					}
				},
				error:function(){
					emailChecked = 0
					alert('네트워크 오류 발생')
				}
			})
		})
		
		// 아이디 중복 안내 메시지 초기화 및 아이디 중복 값 초기화
		$('#register_from #id').keydown(function(){
			idChecked = 0
			$('#message_id').text('')
		})
		
		// 닉네임 중복 안내 메시지 초기화 및 닉네임 중복 값 초기화
		$('#register_from #nick').keydown(function(){
			nickChecked = 0
			$('#message_nick').text('')
		})
		
		// 이메일 이미 가입 안내 메시지 초기화 및 이메일 값 초기화
		$('#register_from #email').keydown(function(){
			emailChecked = 0
			$('#message_email').text('')
		})
		
		// 회원 정보 등록 유효성 체크
		$('#register_form').submit(function(){
			const items = document.querySelectorAll('.check')
			for(let i = 0; i < items.length; i++){
				if(items[i].value.trim()==''){
					const label = document.querySelector('label[for="'+items[i].id+'"]')
					alert(label.textContent + ' 필수 입력입니다.')
					items[i].value=''
					items[i].focus()
					return false	
				}
				
				if(items[i].id == 'id' && !/^[A-Za-z0-9]{4,12}$/.test($('#id').val())){
					alert('영문 숫자 포함 4 ~ 12자로 작성해주세요.')
					$('#id').val('').focus()
					return false
				}
				
				if(items[i].id == 'pwd' && !/^[A-Za-z0-9]{8,16}$/.test($('#pwd').val())){
					alert('영문 숫자 포함 8 ~ 16자로 작성해주세요.')
					$('#pwd').val('').focus()
					return false
				}
				
				if(items[i].id == 'nick' && !/^[가-힣A-Za-z0-9]{2,15}$/.test($('#nick').val())){
					alert('한글 영문 숫자 포함 2 ~ 15자로 작성해주세요.')
					$('#nick').val('').focus()
					return false
				}
				if(items[i].id =='id' && idChecked == 0){
					alert('아이디 중복체크 필수입니다.')
					return false
				}
				
				if(items[i].id =='nick' && nickChecked == 0){
					alert('닉네임 중복체크 필수입니다.')
					return false
				}
				
				if(items[i].id == 'name' && !/^[가-힣]{2,10}$/.test($('#name').val())){
					alert('한글만 입력해주세요.')
					$('#name').val('').focus()
					return false
				}
				
				if(items[i].id == 'tel' && !/^[0-9]{11,11}$/.test($('#tel').val())){
					alert('11자리 숫자로만 입력해주세요.')
					$('#tel').val('').focus()
					return false
				}
				
				if(items[i].id == 'zipcode' && !/^[0-9]{5}$/.test($('#zipcode').val())){
					alert('우편번호를 입력하세요')
					$('#zipcode').val('').focus()
					return false
				}
			}
		})
	})
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div>
		<div>
			<h2>회원가입</h2>
			<form id="register_form" action="registerXuser.do" method="post">
				<div>
					<ul>
						<li>
							<label for="id">아이디</label>
							<input type="text" id="id" name="id" maxlength="12" autocomplete="off" class="check">
							<input type="button" id="id_check" value="중복체크">
							<span id="message_id"></span>
							<div class="form_notice">* 영문 숫자 포함 4 ~ 12자</div>
						</li>
						<li>
							<label for="pwd">비밀번호</label>
							<input type="password" id="pwd" name="pwd" maxlength="16" class="check">
							<div class="form_notice">* 영문 숫자 포함 8 ~ 16자</div>
						</li>
						<li>
							<label for="nick">닉네임</label>
							<input type="text" id="nick" name="nick" maxlength="15" class="check">
							<input type="button" id="nick_check" value="중복체크">
							<span id="message_nick"></span>
							<div class="form_notice">* 한글 영문 숫자 포함 2 ~ 15자</div>
						</li>
						<li>
							<label for="email">이메일</label>
							<input type="email" id="email" name="email" maxlength="50" class="check">
							<input type="button" id="email_check" value="가입체크">
							<span id="message_email"></span>
						</li>
						<li>
							<label for="name">이름</label>
							<input type="text" id="name" name="name" maxlength="6" class="check">
						</li>
						<li>
							<label for="gender">성별</label>
							<label>
								<input type="radio" id="gender" name="gender" class="check" value="남" checked>남자
							</label>
							<label>
							<input type="radio" id="gender" name="gender" class="check" value="여">여자
							</label>
						</li>
						<li>
							<label for="birth">생년월일</label>
							<input type="date" id="birth" name="birth" class="check">
						</li>
						<li>
							<label for="tel">전화번호</label>
							<input type="text" id="tel" name="tel" maxlength="11" class="check">
							<span id="message_id"></span>
							<div class="form_notice">* "-" 제외한 번호 11개 입력</div>
						</li>
						<li>
							<label for="zipcode">우편번호</label>
							<input type="text" name="zipcode" id="zipcode" maxlength="5" class="check" autocomplete="off">
							<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기">
						</li>
						<li>
							<label for="address1">주소</label>
							<input type="text" name="address1" id="address1" maxlength="30" class="check">
						</li>
						<li>
							<label for="address2">나머지주소</label>
							<input type="text" name="address2" id="address2" maxlength="30" class="check">
						</li>
					</ul>
					<div>
						<input type="submit" value="등록">
						<input type="button" value="메인으로"
						onclick="location.href='${ pageContext.request.contextPath }/main/main.do'">
					</div>
				</div>
			</form>
<!-- 다음 우편번호 API 시작 -->
<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_layer = document.getElementById('layer');

    function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_layer.style.display = 'none';
    }

    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    //(주의)address1에 참고항목이 보여지도록 수정
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    //(수정) document.getElementById("address2").value = extraAddr;
                
                } 
                //(수정) else {
                //(수정)    document.getElementById("address2").value = '';
                //(수정) }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode;
                //(수정) + extraAddr를 추가해서 address1에 참고항목이 보여지도록 수정
                document.getElementById("address1").value = addr + extraAddr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("address2").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_layer.style.display = 'none';
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);

        // iframe을 넣은 element를 보이게 한다.
        element_layer.style.display = 'block';

        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
        initLayerPosition();
    }

    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
    function initLayerPosition(){
        var width = 300; //우편번호서비스가 들어갈 element의 width
        var height = 400; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }
</script>
<!-- 다음 우편번호 API 끝 -->
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>