<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>자주묻는질문 FAQ</title>
    <style>
        /* 🌟 스타일 시작 🌟 */

body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #fcfcfc;
}

h1, h2 {
	margin: 0;
	padding: 10px;
	color: #333;
}
h2{
	margin-bottom: 30px;
	margin-left: 15px;
}
/* 헤더 */
.header {
	background-color: #ffeb3b;
	padding: 10px 20px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.header input[type="text"] {
	padding: 5px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

.header button {
	padding: 5px 10px;
	background-color: #fdd835;
	border: none;
	cursor: pointer;
	border-radius: 5px;
}

.nav {
	display: flex;
	justify-content: space-around;
	background-color: #fff;
	padding: 10px 0;
}

.nav a {
	text-decoration: none;
	color: #333;
	padding: 10px 20px;
}

.nav a:hover {
	background-color: #fdd835;
	color: #fff;
	border-radius: 5px;
}

.container {
	display: flex;
	flex-direction: row;
}

/* 사이드바 */
.sidebar {
	width: 20%;
	background-color: #fff9c4;
	padding: 15px;
	box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
}

.sidebar a {
	display: block;
	text-decoration: none;
	color: #333;
	padding: 10px;
	margin-bottom: 10px;
	border-radius: 5px;
}

.sidebar a:hover {
	background-color: #fdd835;
	color: #fff;
}
h1, h2 {
	margin: 0;
	padding: 10px;
	color: #333;
}
h2{
	margin-bottom: 30px;
	margin-left: 15px;
}
/* 헤더 */
.header {
	background-color: #ffeb3b;
	padding: 10px 20px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.header input[type="text"] {
	padding: 5px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

.header button {
	padding: 5px 10px;
	background-color: #fdd835;
	border: none;
	cursor: pointer;
	border-radius: 5px;
}

.nav {
	display: flex;
	justify-content: space-around;
	background-color: #fff;
	padding: 10px 0;
}

.nav a {
	text-decoration: none;
	color: #333;
	padding: 10px 20px;
}

.nav a:hover {
	background-color: #fdd835;
	color: #fff;
	border-radius: 5px;
}

.container{
	display: flex;
	flex-direction: row;
}

/* 사이드바 */
.sidebar {
	width: 20%;
	background-color: #fff9c4;
	padding: 15px;
	box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
}

.sidebar a {
	display: block;
	text-decoration: none;
	color: #333;
	padding: 10px;
	margin-bottom: 10px;
	border-radius: 5px;
}

.sidebar a:hover {
	background-color: #fdd835;
	color: #fff;
}





        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #fffde7;
        }
        .container2 {
            width: 70%;
            margin: 20px auto;
            background-color: #fff;
            border-radius: 15px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 25px;
        }
        .faq-header {
            font-size: 28px;
            font-weight: bold;
            color: #333;
            border-bottom: 2px solid #4CAF50;
            padding-bottom: 15px;
            margin-bottom: 30px;
            text-align: center;
        }
        .faq-item {
            margin-bottom: 25px;
        }
        .faq-question {
            font-size: 20px;
            font-weight: bold;
            color: #555;
            cursor: pointer;
            background-color: rgba(76, 200, 80, 0.5); /* #4CAF50 with 50% opacity */
            padding: 10px;
            border-radius: 5px;
        }
       
           
        
        .faq-answer {
            font-size: 16px;
            color: #666;
            margin-top: 10px;
            background-color: #fffbde;
            padding: 10px;
            border-left: 4px solid #ffcc00;
            display: none;
            border-radius: 5px;
        }
        .faq-question:hover {
            color: #ff9900;
            background-color: #fff3b0;
        }
        .pagination {
            text-align: center;
            margin-top: 20px;
        }
        .pagination a {
            text-decoration: none;
            color: #333;
            padding: 8px 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin: 0 5px;
        }
        .pagination a:hover {
            background-color: #ffcc00;
            color: #fff;
        }
        .pagination .active {
            background-color: #4CAF50;
            color: #fff;
            border: 1px solid #4CAF50;
        }
    </style>
    <script>
        // 🐥 질문 클릭 시 답변 토글 스크립트 🐥
        function toggleAnswer(id) {
            const answer = document.getElementById(id);
            if (answer.style.display === "none") {
                answer.style.display = "block";
            } else {
                answer.style.display = "none";
            }
        }
    </script>
    <script>
        // 비공개 상태 선택 시 비밀번호 입력 필드 활성화
        function togglePasswordField() {
            var visibility = document.getElementById("visibility").value;
            var passwordField = document.getElementById("sup_pwd");
            var passwordInput = document.getElementById("sup_pwd_input");
            
            // 비공개 선택 시 비밀번호 입력 필드 보여주고, 공개 선택 시 숨기기
            if (visibility === "1") { 
                passwordField.style.display = "block";
                passwordInput.setAttribute("required", "true"); // 비공개일 때만 required 속성 추가
            } else {
                passwordField.style.display = "none";
                passwordInput.removeAttribute("required"); // 공개일 때는 required 속성 제거
            }
        }

        // 페이지 로드 시 비공개 상태일 경우 비밀번호 입력 필드 표시
        window.onload = function() {
            togglePasswordField(); // 초기 로드 시 호출해서 비공개 상태 체크
        };
    </script>
    <script>
        function scrollToHash() {
            const hash = window.location.hash; // 현재 URL의 #hash 값을 가져옴
            if (hash) {
                const target = document.querySelector(hash); // #q4에 해당하는 요소 선택
                if (target) {
                    target.scrollIntoView({ behavior: "smooth" }); // 부드럽게 스크롤
                    const answer = target.querySelector(".faq-answer"); // 답변 부분 찾기
                    if (answer) {
                        answer.style.display = "block"; // 답변을 바로 열기
                    }
                }
            }
        }
    </script>
<script>
    // 🐤 페이지 로드 시 해시 값 스크롤
    window.onload = function () {
        const hash = window.location.hash; // 현재 URL의 #hash 값 가져오기
        if (hash) {
            const target = document.querySelector(hash); // #q4에 해당하는 요소 찾기
            if (target) {
                target.scrollIntoView({ behavior: "smooth" }); // 부드럽게 스크롤
                const answer = target.querySelector(".faq-answer"); // 해당 질문의 답변 찾기
                if (answer) {
                    answer.style.display = "block"; // 답변 열기
                }
            }
        }
    };
</script>
</head>
<body>

	<!-- 🐤 헤더 -->
	<div class="header">
		<h1>고객센터</h1>
		 <div class="search-bar">
        <form action="Search.do" method="get" style="display: flex; align-items: center;">
            <!-- 검색어 입력 -->
            <input type="text" name="keyword" placeholder="자주 묻는 질문 검색" style="flex: 1; padding: 5px; border: 1px solid #ccc; border-radius: 5px;" required>
            <!-- 검색 버튼 -->
            <button type="submit" style="padding: 5px 10px; background-color: #fdd835; border: none; cursor: pointer; border-radius: 5px; margin-left: 10px;">검색</button>
        </form>
    </div>
	</div>

	<div class="nav">
		<a href="${pageContext.request.contextPath}/support/List.do">문의 내역</a>
		<a href="${pageContext.request.contextPath}/support/FaqList.do">자주
			묻는 질문</a> <a
			href="${pageContext.request.contextPath}/support/FeedBackList.do">고객의
			소리</a>
	</div>

	<div class="container">
		<div class="sidebar">
			<a href="${pageContext.request.contextPath}/support/FaqList.do">자주
				묻는 질문</a> <a
				href="${pageContext.request.contextPath}/support/LoginaAcount.do">로그인
				및 계정</a> <a
				href="${pageContext.request.contextPath}/support/RefundGuide.do">결제
				및 환불</a> <a
				href="${pageContext.request.contextPath}/support/ChallengeHelp.do">꼬박꼬박
				챌린지</a> <a
				href="${pageContext.request.contextPath}/support/CommunityHelp.do">꼬박꼬박
				커뮤니티</a>
		</div>
</head>
<body>
    <div class="container2">
        <!-- 🌟 헤더 🌟 -->
        <div class="faq-header">자주 묻는 질문 FAQ ✨</div>

        <!-- 🌟 FAQ 리스트 🌟 -->
        <div class="faq-item">
            <div class="faq-question" onclick="toggleAnswer('answer1')">🐥 Q1. 참가비 및 상금 환급 프로세스</div>
            <div class="faq-answer" id="answer1">
                A1. 꼬박꼬박에서 참가비와 상금을 환급받는 프로세스는 다음과 같습니다. <br>
                <br>
                 1️챌린지 결과 확인 <br>
                 *챌린지는 종료 다음날(낮 12시:30분 기준) 결과를 발표합니다.<br>
                 (예외적으로 종료+2일에 결과를 발표하는 챌린지가 존재하며, 진행 중인 챌린지의 발표일은<br>
                 상세페이지에서 확인 가능)
                 <br>
                 * 결과 확인 즉시, 참가비가 상금으로 환급됩니다.<br>
                 *85%이상 달성 시 전액 환급, 85% 미만 달성 시 달성률 만큼 환급됩니다.<br> ex) 10,000 참가비로 80% 달성 시, 8000원 환급
              <br>
              2. 예치금 사용 및 출금<br>
* 예치금은 앱 내에서 현금처럼 사용 가능합니다.<br>
* 예치금은 금액과 관계없이 자유롭게 출금 가능하며, 처 음 납부하신 방법으로만 출금이 가능합니다. (계좌입금 또 는 카드승인 취소)<br>
출금 방법: 마이페이지> 예치금> 계좌이체/ 카드취소
계좌이체는 평일 기준 오후 5시에 일괄 처리되며, 카드 승 인 취소는 카드사 정책에 따라 최대 7 영업일이 소요됩니다.<br>
<br>
3. 상금 출금<br>
100% 달성으로 취득한 상금은 앱 내에서 사용할 수는 없 고 출금만 가능합니다. (3,000원 단위로 출금 가능 21년
5월 22일 개정)
            </div>
        </div>
        <div class="faq-item">
            <div class="faq-question" onclick="toggleAnswer('answer2')">🐤 Q2. 불가피한 사정으로 챌린지 진행이 어려워요 </div>
            <div class="faq-answer" id="answer2">
                A2. 마이페이지 > 계정 설정에서 이메일 주소를 수정할 수 있어요! 인증 메일 확인을 꼭 해주세요. 📧
            </div>
        </div>
        <div class="faq-item">
            <div class="faq-question" onclick="toggleAnswer('answer3')">🐣 Q3. 개설 탭에 있는 챌린지 개설을 하려고 하는데, 챌린지 개설 승인 절차가 있나요?</div>
            <div class="faq-answer" id="answer3">
                A3. 챌린지 개설을 완료하면 별도 승인 절차 없이 개설 탭에 바로 노출됩니다.<br>
                다만, 타인에게 불쾌감을 주거나 부적절한 주제로 판단될 경우 꼬박꼬박의 권한으로 삭제될 수 있습니다. 😢 
        </div>
        <br>
    <div class="faq-item" id="q4">
    <div class="faq-question" onclick="toggleAnswer('answer4')">🐤 Q4. 혼자 개설해도 진행이 될까요?</div>
    <div class="faq-answer" id="answer4" style="display: none;">
        A4. 네, 가능합니다. 다만, 혼자 진행하시거나 지인분들과 같이 하는 경우에도 공식 챌린지와 동일하게 85% 미만 달성자들은 벌금이 발생됩니다.<br>
        <br>
        100% 달성자가 없어 상금을 받으실 참가자가 없을 경우, 예치금은 꼬박꼬박에 귀속됩니다. 💌
    </div>
</div>
        <div class="faq-item">
            <div class="faq-question" onclick="toggleAnswer('answer5')">💛 Q5. 예치금과 상금은 소멸되나요? 유효기간이 있나요?</div>
            <div class="faq-answer" id="answer5">
                A5. 회원님께서 직접 결제하신 예치금은 유효기관이 없습니다 하지만,꼬박꼬박을 통해서 획득하신 상금은 획득일로부터 1년간 유효합니다. 만약 1뇬 이내 현금으로 인출하지 않을 경우 적립된 순서대로 소멸됩니다. 🛠<br>
                <br>
               만료 전 가입 시 이메일을 통해 소멸 예정일을 알려드리고 있습니다.<br>
              ex) 24년 11월 9일 만료 예정의 경우, 11월 9일 00:00시에 해당 상금이 소멸됩니다.<br>
              <br>
              * 상금은 10,000원 단위로 출금 가능합니다.
              ️
            </div>
        </div>
         <div class="faq-item">
            <div class="faq-question" onclick="toggleAnswer('answer6')">🌼 Q6. 챌린지를 완료했는데 환급은 언제되나요? </div>
            <div class="faq-answer" id="answer6">
                A6. 챌린지를 챌린지를 완료하신 경우, 챌린지 종료 다음날 낮 12시 30
분이 지나면 앱에서 결과를 확인하실 수 있습니다.<br>
<br>
• 결과 확인 및 참가비 환급 요청:
<br>
인증 탭 내 챌린지 목록 중, 원하는 챌린지의 우측에 위치 한 [결과확인하기>]버튼을 누르시고, 결과 페이지에서 '확 인'을 누르셔야 참가비가 환급됩니다.<br>
<br>
* 혹, 여기서 결과 확인 버튼이 나오지 않는다면 해당 화면 을 캡처하여 1:1문의하기에 남겨주시면 개발팀과 확인하도 록 하겠습니다.<br>
<br>
• 참가비 환급:<br>
<br>
참가비는 예치금으로 환급되며, 최종적으로 출금을 원하시 면 [마이페이지> 예치금> 계좌이체 / 카드취소]를 통해 서 신청하실 수 있습니다. 예치금은 언제든 출금이 가능하 며, 신규 챌린지 신청 시에도 사용 가능합니다.<br>
<br>
* 참가비는 처음 납부하신 방법으로만 환급이 가능합니다.<br>
(계좌이체>계좌입금 / 카드신청 〉 카드승인취소) 카드사 정책에 따라 카드 결제 취소는 최대 7영업일이 소요되는 점 참고 부탁드립니다. 감사합니다. 🛠️
            </div>
        </div>
        <div class="faq-item">
            <div class="faq-question" onclick="toggleAnswer('answer7')">⭐️ Q7. 비공개 챌린지는 어떻게 만드나요? </div>
            <div class="faq-answer" id="answer7">
                A7. 챌린지 설정에서 '비공개' 모집을 선택 후 참가코드를 설정 하시면 기존의 방식과 동일하게 참가코드를 입력하고 참여 할 수 있습니다.
            </div>
        </div>
         <div class="faq-item">
            <div class="faq-question" onclick="toggleAnswer('answer8')">🌝 Q8. 지난 챌린지에서 지불했던 벌금을 다시 받을 수 있나요? </div>
            <div class="faq-answer" id="answer8">
                A8. 지난 챌린지에서 납부했던 벌금은 다시 받을 수 없습니다. 🥸
            </div>
        </div>
           <div class="faq-item">
            <div class="faq-question" onclick="toggleAnswer('answer9')">🧀 Q9. 계좌이체 시 수수료가 있나요? </div>
            <div class="faq-answer" id="answer9">
                A9. 계좌 이체 수수료는 기본적으로 존재하나, 현재 꼬박꼬박에서 회원님의 편의를 위해 해당 수수료를 무료화한 상태입니다. 🙏 
            </div>
        </div>
         <div class="faq-item">
            <div class="faq-question" onclick="toggleAnswer('answer10')">🐥 Q10. 개설한 챌린지 내용을 변경하고 싶어요. </div>
            <div class="faq-answer" id="answer10">
                A10. 개설 완료된 챌린지의 경우 참가자 전원이 동의를 하실경우 챌린지 취소만 도움 드릴 수 있으니 개설시 유의해 주시기 바랍니다. 😉
             
            </div>
        </div>

        <!-- 🌟 페이지네이션 🌟 -->
        <div class="pagination">
            <a href="#" class="active">1</a>
            <a href="#" >2</a>
            <a href="#">3</a>
            <a href="#">4</a>
            <a href="#">5</a>
            
        </div>
    </div>
</body>
</html>
