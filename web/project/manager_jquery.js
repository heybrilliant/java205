

// 회원의 정보 : 아이디, 비밀번호, 이름
// Member -> 생성자 함수를 정의 
function Member(id, pw, name) {
    this.userID = id;
    this.pw = pw;
    this.userName = name;
};
// 객체가 가지는 메소드는 공통으로 사용 -> prototype 이용
Member.prototype.makeHtml = function () {
    return '[id : ' + this.userID + 'pw : ' + this.pw + 'name : ' + this.userName + ']'
};

// 회원의 정보를 저장하는 배열 
var members = []; // new Array()

// 배열 -> JSON(문자열)-> localStorage 저장 
// 저장 
// 수정
// 삭제 
// setItem('members', JSON.stringify(members))

///////////////////////////////

// 사용자가 입력한 정보를 가지고 Member 객체를 생성
// submit 이벤트 연결 해줘야한다

$(document).ready(function(){ 

    // localStorage 저장된 데이터가 있는지 확인
    // localStorage.getItem('members') 없으면 null 반환
    if (localStorage.getItem('members') == null) {
        // 배열 members 를 저장 
        localStorage.setItem('members', JSON.stringify(members));
    } else {
        JSON.parse(localStorage.getItem('members')); // JSON 문자열 -> 객체로 변환
        console.log(members);
        // 테이블 세팅
        setList();
    }


    var id = $('#userID');
    var pw = $('#pw');
    var repw = $('#repw');
    var userName = $('#userName');


    //regForm 캐스팅
    $('#regForm').submit(function(){
        // id(이메일) 유효성 체크
        var idReg = /^[a-z0-9_+.-]+@([a-z0-9]+\.)+[a-z0-9]{2,4}$/;

        // id 공백 확인
        if(id.val().trim().length < 1) {
            //alert('아이디를 입력해주세요');
            $('#userID+div.msg').html('필수항목입니다.')
            $('#userID+div.msg').css('display','block');
            return false;
        }
        // trim : 좌우 공백을 없애주는 함수
        //userID.trim().length <1 = 값을 입력하지 않았다는 뜻

        //id(이메일) 형식 체크
        if(!idReg.test(id.val())){
            $('#userID+div.msg').html('이메일 형식으로 입력해주세요');
            $('#userID+div.msg').css('display','block');
            return false;
        }

        // 비밀번호 입력 
        if (pw.val().trim().length < 1) {
            //alert('비밀번호를 입력해주세요');
            $('#pw+div.msg').html('필수항목입니다.');
            $('#pw+div.msg').css('display','block');
            return false;
        }

        if (repw.val().trim().length < 1) {
            //alert('비밀번호를 입력해주세요');
            $('#repw+div.msg').html('필수항목입니다.');
            $('#repw+div.msg').css('display','block');
            return false;
        }

        // 비밀번호-비밀번호 확인 일치 여부 체크
        if (pw.val().trim() != repw.val().trim()) {
            $('#repw+div.msg').html('비밀번호가 일치하지 않습니다. \n 다시 입력해주세요.');
            $('#repw+div.msg').css('display','block');
            return false;
        }

        // 사용자 이름 정보 
        if (userName.val().trim() < 1) {
            //alert('이름을 입력해주세요');
            $('#userName+div.msg').html('필수항목입니다.');
            $('#userName+div.msg').css('display','block');
            return false;
        }

        // 배열에 사용자 정보를 추가
        members.push(new Member(id.val(),pw.val(),userName.val()));

        // 저장 
        localStorage.setItem('members',JSON.stringify(members));

        alert('등록되었습니다.');
        console.log('회원 리스트', members);

        //Form 초기화
        this.reset();

        // 테이블 세팅
        setList();

        return false;
    });

    $(id).focus(function(){
        $('#userID+div.msg').css('display','none');
        $('#userID+div.msg').html('');
    });

    $(pw).focus(function(){
        $('#pw+div.msg').css('display','none');
        $('#pw+div.msg').html('');
    });

    $(repw).focus(function(){
        $('#repw+div.msg').css('display','none');
        $('#repw+div.msg').html('');
    });

    $(userName).focus(function(){
        $('#userName+div.msg').css('display','none');
        $('#userName+div.msg').html('');
    });
});

// 배열에 있는 요소를 -> table에 tr 행을 만들어서 추가해줌
function setList() {

    // table의 tbody 캐스팅 
    var list = $('#list');

    var tbody = '<tr>';
    tbody += '  <th>순번(index)</th>';
    tbody += '  <th>아이디</th>';
    tbody += '  <th>비밀번호</th>';
    tbody += '  <th>이름</th>';
    tbody += '  <th>관리</th>';
    tbody += '</tr>';

    if (members.length < 1) {

        tbody += '<tr>';
        tbody += '<td colspan=5>데이터가 존재하지 않습니다</td>';
        tbody += '</tr>';

    } else {

        for (var i = 0; i < members.length; i++) {

            tbody += '<tr>';
            tbody += '  <td>' + i + '</td>';
            tbody += '  <td>' + members[i].userID + '</td>';
            tbody += '  <td>' + members[i].pw + '</td>';
            tbody += '  <td>' + members[i].userName + '</td>';
            tbody += '  <td><a href = "javascript:editMember(' + i + ')">수정</a>|<a href ="javascript:deleteMember(' + i + ')">삭제</a></td>';
            tbody += '</tr>';
        }

    }
    $('#list').html(tbody);
}

// 배열의 요소 삭제 함수
function deleteMember(index) {
    // alert(index + ' 인덱스의 요소를 삭제합니다.');

    //var chk = confirm('삭제하시겠습니까?');
    // chk-> 삭제하겠다 하면 배열의 index 요소를 삭제
    // splice(index, count) : index에서 시작해서 count 만큼의 요소를 삭제하고 남은 요소의 배열을 반환한다
    // splice(index, 1) 
    if (confirm('삭제하시겠습니까?')) {
        members.splice(index, 1); // 삭제 코드가 된다
        alert('삭제되었습니다!');

        // 저장
        localStorage.setItem('members', JSON.stringify(members));
        // 테이블 리스트 갱신해줘야함 (삭제된 테이블 제외)
        setList();
    } 
}

// 배열의 요소 수정하는 함수
function editMember(index) {

    // 수정 폼 영역이 노출되어야한다 
    $('#editFormArea').css('display','block');

    // // editFor의 태그들의 value값을 세팅
    // var editID = $('#editID');
    // var editPw = $('#editPw');
    // var editRepw = $('#editRepw');
    // var editName = $('#editName');
    // var index = $('#index');

    $('#editID').val(members[index].userID);
    $('#editPw').val(members[index].userPw);
    $('#editRepw').val(members[index].userRepw);
    $('#editName').val(members[index].userName);
    $('#editIndex').val(index);

    $('#editForm').submit = function(){
        // var member = new Member(editID.value, editPw.value, editName.value)
        // console.log(editIndex.value, member);

        // 비밀번호와 비밀번호 확인이 같은지 체크 
        if (editPw.val() != editRepw.val()) {
            alert('비밀번호가 같지 않습니다');
            return false;
        }

        if (!confirm('수정하시겠습니까?')) {
            return false;
        }

        members[$('#editIndex').val()].pw = $('#editPw').val();
        members[$('#editIndex').val()].userName = $('#editName').val();

        // 저장 
        localStorage.setItem('members',JSON.stringify(members));

        alert('수정되었습니다.');

        // 테이블 세팅
        setList();

        editMemberClose();

        return false;
    };
}

function editMemberClose() {
    $('#editFormArea').css('display', 'none');
}
