<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/jsp/header.jsp" %>
<style>
#buttons {
	display: block;
}
#register {
	display: none;
}
</style>
<script src="js/jquery-3.4.1.min.js"></script>
<script>
var json = {
	"list": [
<c:forEach var="word" items="${wordList }">
	{
		"id": <c:out value="${word.id }" />,
		"word": "<c:out value="${word.word }" />",
// 		"descriptions": [
// 			<c:forEach var="d" items="${word.descriptions }">
// 			{
// 				"description": "<c:out value="${d.description }" />",
// 				"part_of_speech": "<c:out value="${d.partOfSpeech.name }" />",
// 			},
// 			</c:forEach>
// 		],
	},
</c:forEach>
	]
};
var counter = 10;
var intervalId = null;
var flg = false;
// function showAnswer() {
// 	stopCountDown();
// 	var id = $("#index").val();
// 	var answer = "";
// 	for (var i = 0; i < json.list[id].descriptions.length; i++) {
// 		answer += json.list[id].descriptions[i].description + " (" + json.list[id].descriptions[i].part_of_speech + ")<br>";
// 	}
// 	$("#japanese p").html(answer);
// }
function showNext(e) {
	console.log(e.target.id);
	// カウンtのダウンをストップ
	stopCountDown();
	// 回答を非表示に
	$("#japanese p").html("");
	if (e.target.id === "goodNext") {
		// 正解の場合
		var good = parseInt($("#good").val()) + 1;
		$("#good").val(good);
		
	} else if (e.target.id === "badNext") {
		// 不正解の場合
		var bad = parseInt($("#bad").val()) + 1;
		$("#bad").val(bad);
	}
	
	var index = parseInt($("#index").val()) + 1;
	if (index >= json.list.length) {
		// 終了
		$("#english").text("");
		var good = parseInt($("#good").val());
		var total = parseInt($("#total").val());
		$("#pGood").text("正解 : " + good);
		$("#pBad").text("不正解 : " + $("#bad").val());
		$("#pTotal").text("合計 : " + total);
		$("#pRate").text("正解率 : " + (good/total* 100) + "%");
		$("#buttons").hide();
		$("#japanese").hide();
		$("#register").show();
		
	} else {
		$("#index").val(index);
		$("#wordId").val(json.list[index].id);
		$("#english").text(json.list[index].word);
		startCountDown();
	}
	
}

function ajaxTest() {
	stopCountDown();
	var id = $("#wordId").val();
	// Ajax通信処理
    $.ajax({
       // リクエストタイプ（省略するとGETがデフォルトになります。）
        type: "POST",
        // リクエスト送信先URLの設定
        url: 'WordsTest?mode=answer&id=' + id,
       /*  dataType: 'json',
        data : {"mode" : "answer", "id" : 1 }, */
        // 非同期通信フラグ
        async: false,
     }).done(function(data, textStatus, jqXHR) {
       // 成功時の場合の処理
       var answer = "";
		for (var i = 0; i < data.descriptions.length; i++) {
			answer += data.descriptions[i].description + " (" + data.descriptions[i].part_of_speech + ")<br>";
		}
       $("#japanese p").html(answer);
     }).fail(function(jqXHR, textStatus, errorThrown) {
       // エラーの場合の処理
       $("#test").text("エラーが発生しました。ステータス：" + jqXHR.status);
     });
}
function startCountDown() {
	if (flg === false) {
		intervalId = setInterval(countDown, 1000);
		flg = true;
		$("#countdown").text("10");
	}
}
function stopCountDown() {
	if (flg === true) {
		clearInterval(intervalId);
		flg = false;
		counter = 10;
		$("#countdown").text("");
	}
}
function countDown() {
	if (counter === 0) {
		stopCountDown();
	//	$("#answer").click();
		ajaxTest();
		
	} else {
		counter--;
		$("#countdown").text(counter);
	}
}
$(document).ready(function() {
	console.log(json.list[0].id);
	$("#total").val(json.list.length);
	$("#english").text(json.list[0].word);
	$("#wordId").val(json.list[0].id);
// 	$("#answer").click(showAnswer);
	$("#goodNext").click(showNext);
	$("#badNext").click(showNext);
	$("#jsonpost").click(ajaxTest);
	startCountDown();
});
</script>
</head>
<body>
<h1><c:out value="${title }" /></h1>
<button id="jsonpost">テスト</button>
<div id="test"></div>

<div id="countdown">10</div>
<table>
	<tr>
		<td id="english">
		</td>
	</tr>
	<tr>
		<td id="japanese">
			<p></p>
			<input type="hidden" name="index" id="index" value="0">
			<input type="hidden" name="id" id="wordId" value="">
			<button id="answer">回答</button>
		</td>
	</tr>
	<tr id="buttons">
		<td>
			<button id="goodNext">正解：次へ</button>
			<button id="badNext">不正解：次へ</button>
		</td>
	</tr>
	<tr>
		<td>
			<p id="pRate"></p>
			<p id="pTotal"></p>
			<p id="pGood"></p>
			<p id="pBad"></p>
		</td>
	</tr>
	<tr id="register">
		<td>
			<form action="WordsTest" method="post">
				<input type="hidden" name="level" value="<c:out value="${level }"/>">
				<input type="hidden" name="mode" value="result">
				<input type="hidden" name="total" id="total" value="0">
				<input type="hidden" name="good" id="good" value="0">
				<input type="hidden" name="bad" id="bad" value="0">
				<input type="submit" value="登録">
			</form>
		</td>
	</tr>
</table>
</body>
</html>
