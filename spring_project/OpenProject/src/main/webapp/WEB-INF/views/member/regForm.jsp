<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Open Project : 회원가입</title>

<%@ include file="/WEB-INF/views/frame/metaheader.jsp" %>

<style>

	.display_none{
		display : none;
	}
		
	.color_blue {
		color: blue;
	}

	.color_red {
		color: red;
	}
	
		#loadingimg{
		height : 25px;
	}
	
</style>
<script>
	$(document).ready(function(){

		$('#memberid').focusin(function(){
			$('#msg').addClass('display_none'); /* 메세지가 보이지 않게해줌 */
			$('#msg').removeClass('color_blue');
			$('#msg').removeClass('color_red');

			$(this).val(''); // 그 전에 써있던 데이터가 있던 없던 보여줄것
		});

		$('#memberid').focusout(function() {
			// ajax로 비동기 통신 해줄 것임 -> 서버로 id를 보내고 사용 가능 유무의 응답코드를 받음 -> 그 이후 화면에 메시지 출력
				
			
			
			$.ajax({
				url : '<c:url value ="/member/idCheck"/>',
				type : 'post',
				data : {
					mid : $(this).val()
				}, // 데이터는 객체형식(mid의 파라미터 형식)으로 보냄
				beforeSend : function() {
					$('#loadingimg').removeClass('display_none');
				},
				success : function(data) {
					// data : Y / N 으로 받아오기
					if (data == 'Y') {
						$('#msg').html('사용가능'); //$('#msg').text 사용도 상관없음
						$('#msg').addClass('color_blue');
						$('#msg').removeClass('display_none');
					} else { // data == N 일때
						$('#msg').html('사용불가');
						$('#msg').addClass('color_red');
						$('#msg').removeClass('display_none');
					}
				},
				error : function(request, status, error) {
					alert('! 서버 통신에 문제가 발생했습니다.\n! 다시 실행해주세요.');
					console.log(request);
					console.log(status);
					console.log(error);
				}, // suc or err 둘 중 하나라도 응답이 오면 마지막에 응답하는 속성
				complete : function(){
					
					$('#loadingimg').addClass('display_none');
					
				}
			});

		});

	});
</script>
</head>
<body>

<%@ include file="/WEB-INF/views/frame/header.jsp" %>

<%@ include file="/WEB-INF/views/frame/nav.jsp" %>


	<!-- 콘텐츠영역 -->
	
	<div id="content">
		<h2>회원가입</h2>
		<hr>

		<form method="post" enctype="multipart/form-data">
		
			<table>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="memberid" id="memberid">
						<span id="msg" class="display_none"></span>
						<img id="loadingimg" class="display_none" alt="loading" 
						src="<c:url value="/images/loading.gif"/>"> 
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="password"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="membername"></td>
				</tr>
				<tr>
					<td>사진</td>
					<td><input type="file" name="photo"></td>
				</tr>

				<tr>
					<td></td>
					<td><input type="submit"> 
					<input type="reset">
					</td>
				</tr>
			</table>
		</form>
	
			<div>
			ajax로 회원 가입 <input type="button" value="회원가입" id="btnReg1">
			</div>
			<div>
			ajax로 Json 전송 회원 가입 <input type="button" value="회원가입" id="btnReg2">
			</div>
	
	</div>
	
	<script>
		$(document).ready(function() {
			$('#btnReg1').click(function() {
				var photoFile = $('#photo');
				var file1 = photoFile[0].files[0];
				//console.log(file1);
				var formData = new FormData();
				formData.append("memberid", $('#memberid').val());
				formData.append("password", $('#password').val());
				formData.append("membername", $('#membername').val());
				formData.append("photo", file1);
				console.log(formData);
				$.ajax({
					url : '/op/members/reg1',
					type : 'post',
					data : formData,
					enctype : 'multipart/form-data',
					processData : false,
					contentType : false,
					cache : false,
					success : function(data) {
						console.log(data);
						if(data==1){
							alert("회원가입 되었습니다.");
						}
					}
				});
			});
			
			
			$('#btnReg2').click(function() {
				var userid = $('#memberid').val();
				var pw = $('#password').val();
				var username = $('#membername').val();
				var member = {
						memberid: userid,
						password: pw,
						membername: username
				}
				
				console.log(JSON.stringify(member));
				
				$.ajax({
					url : '/op/members/reg2',
					type : 'post',
					data : JSON.stringify(member),
					dataType : 'json',
					contentType : 'application/json',
					success : function(data) {
						console.log(data);
						if(data==1){
							alert('회원가입이 되었습니다.');
						}
					}
				});
			});
		});
	</script>


</body>
</html>