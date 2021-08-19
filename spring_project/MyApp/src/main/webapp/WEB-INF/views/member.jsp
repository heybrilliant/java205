<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 리스트</title>
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

	div.card{
		float : left;
		
		
		width : 300px;
		height : 150px;
		padding : 10px;
		border : 1px solid #AAA;
		border-radius : 5px;
		margin : 5px;
	}

	#regBtn{
		cursor : pointer;
	}

	img{
		width : 30px;
		
	}

</style>

<script src="htts://code.jquery.com/jquery-1.12.4.min.js"></script>
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
				url :'http://3.38.104.221:8080/op/member/idCheck',
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
		
		$('#submit').click(function(){

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
						url : 'http://3.38.104.221:8080/op/members/reg1',
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
								$('#regform').addClass('display_none');
								memberList();
							}
						}
					});
					
					
				});
		
				$('#regBtn').click(function(){
					
					$('#regform').removeClass('display_none');
					$('#msg').addClass('display_none');
					$('#memberid').val('');
					$('#password').val('');
					$('#membername').val('');
					$('#photo').val('');
				});
				
				$('#formclose').click(function(){
					$('#regform').addClass('display_none');	
				});
				
		memberList();
		
	});
	
			
	
	function memberList(){
		$.ajax({
			url : 'http://3.38.104.221:8080/op/members',
			type : 'GET',
			success : function(data){
				console.log(data);
				$.each(data, function(index, item){
					console.log(index,item);
					
					var html = '<div class="card">';
					html += 'idx : ' +  item.idx + '<br>';
					html += '아이디 : ' +  item.memberid + '<br>';
					html += '이름 : ' +  item.membername + '<br>';
					html += '사진 : <img src="http://3.38.104.221:8080/op/uploadfile/' +  item.memberphoto + '"><br>';
					html += '가입일 : ' +  item.regdate + '<br>';
					html += '</div>';
					
					$('#memberlist').append(html);
					
				});
			}
			
		});
	}
	
	
</script>
</head>
<body>
	
	<div id="menu">
		<span id="regBtn">회원가입</span>
	</div>

	<div id="regform" class="display_none">
		<h1>회원가입</h1>
		<hr>
		
			<table>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="memberid" id="memberid">
						<span id="msg" class="display_none"></span>
						<img id="loadingimg" class="display_none" alt="loading" 
						src="http://localhost:8080/op/images/loading.gif"> 
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
					<td><input type="submit" id="submit">
					<input type="reset"> 
					<input type="button" value="입력 폼 닫기" id="formclose"></td>
				</tr>
			</table>
		
	</div>

	<h1>회원 리스트</h1>
	<hr>
	<div id="memberlist">
		
	</div>


</body>
</html>