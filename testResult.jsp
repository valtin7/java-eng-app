<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/jsp/header.jsp" %>
<style>
#graph {
	border: 1px solid #666666;
}

</style>
<script src="js/jquery-3.4.1.min.js"></script>
<script>
var json = {
	"result": [
<c:forEach var="result" items="${resultList }">
	{
		"id": <c:out value="${result.id }" />,
		"type": "<c:out value="${result.type }" />",
		"level": "<c:out value="${result.level }" />",
		"total": "<c:out value="${result.total }" />",
		"correct": "<c:out value="${result.correct }" />",
		"wrong": "<c:out value="${result.wrong }" />",
		"insDate": "<c:out value="${result.insDate }" />",
	},
</c:forEach>
	]
};
function drawGraph() {
	// キャンバスのコンテキストを取得
	var canvas = $("#graph").get(0);
	var context = canvas.getContext("2d");
	// グラフ原点の定義
	var basex = parseInt(canvas.width * 0.1);
	var basey = parseInt(canvas.height * 0.8);
	// グラフの幅と高さ
	var graphWidth = parseInt(canvas.width * 0.8);
	var graphHeight = parseInt(canvas.height * 0.7);
	
	// 背景職の設定
	context.fillStyle = "#cccccc";
	context.fillRect(basex, basey - graphHeight, graphWidth, graphHeight);
	
	// 軸を表示
	context.beginPath();
	context.moveTo(basex, basey - graphHeight);
	context.lineTo(basex, basey);
	context.lineTo(basex + graphWidth, basey);
	context.strokeStyle = "#666666";
	context.stroke();
	
	// 文字フォントを定義
	context.font = "13px 'MS ゴシック'";
	// グラフを描画
	var jsonLen = json.result.length;
	for (var i = 0; i < jsonLen; i++) {
		// グラフの値
		var rate = json.result[i].correct / json.result[i].total * 100;
		// 棒の中心のx座標
		var x = basex + (graphWidth / jsonLen) * i + ((graphWidth / jsonLen) / 2);
		// 棒グラフの幅を定義
		var barWidth = (graphWidth / jsonLen) * 0.7;
		// 棒グラフの高さを算出
		var barHeight = graphHeight * 0.9 * (rate / 100);
		// 棒グラフを描画
		context.fillStyle = "#669900";
		context.fillRect(x - barWidth / 2, basey - barHeight, barWidth, barHeight);
		if (!context.fillText) {
			// fillText89メソッドの実装がない場合は以下の処理をスキップ
			continue;
		}
		// 目盛と値の表示幅
		var textWidth = (graphWidth / jsonLen) * 0.9;
		// テキスト表示を中心に
		context.textAlign = "center";
		// x 軸の目盛りを描画
		context.textBaseline = "top";
		context.fllStyle = "#000000";
		context.fillText(json.result[i].insDate, x, basey + 3, textWidth);
		// 値を描画
		context.textBaseLine = "ideographic";
		context.fillStyle = "#000000";
		context.fillText(rate + "%", x, basey - barHeight, textWidth);
		
	}
	
}
$(document).ready(function() {
	console.log(json.result[0].id);

	drawGraph();
});
</script>
</head>
<body>
<h1><c:out value="${title }" /></h1>
<canvas id="graph" width="500" height="400"></canvas>
</body>
</html>
