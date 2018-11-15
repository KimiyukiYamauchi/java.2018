<%! page contentType="text/html;charset=UTF-8">
<!DOCTYPE html>
<html>;
<head>
<meta charset="UTF-8" />
<title>ポストデータ</title>
</head>
<body>
(4)
String food = requst.(5)("food");
(6)(food.equals("ラーメン")){
	out.println("ぼくも大好きです。");
} else (6) (food.equals("カレーライス")) {
	out.println("まぁまぁですね。");
} else (6) (food.equals("納豆ごはん")) {
	out.println("この世の食べ物とも思えない。");
} else {
	out.println("？？？");
}
</body>
</html>