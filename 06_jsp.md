# JSP(JavaServer Pages)の基本

## JSPページで使える主な要素

| 番号 | 名前 | 構文 | 概要 |
|:-----|:-----|:-----|:-----|
|1|ディレクティブ|<%@〜%\>|ページ単位の処理方法を指定|
|2|宣言部|<%!〜%\>|変数や定数、ユーザ定義メソッドを宣言|
|3|スクリプトレット|<%〜%\>|ページの処理方法を記述|
|4|式(Expression)|<%=〜%\>|指定された式を出力|
|5|アクションタグ|<jsp:〜\>|典型的な処理をタグの形式で記述|
|6|コメント|<%--〜--%\>|処理に関しては無視される備考を記述|

### ディレクティブ

| ディレクティブ | 概要 |
|:---------------|:-----|
|@page|ページの基本的な処理方法を決める|
|@include|外部ファイルをインクルードする|
|@taglib|ページ内で使用するタグライブラリを宣言する|
|@attribute|タグファイルで使える属性を宣言する(タグファイルでのみ使用可)|
|@tag|タグファイルの基本情報を定義する(タグファイルでのみ使用可)|
|@variable|タグファイルで使える変数を宣言する(タグファイルでのみ使用可)|

#### @pageディレクティブ

| 属性名 | 概要 | デフォルト値 |
|:-------|:-----|:-------------|
|contentType|ページのコンテンツタイプ|text/html|
|pageEncoding|.jspファイルの文字コード|(contentType属性の値)|
|buffer|出力バッファのサイズ(単位はキロバイト)|8|
|autoFlush|バッファサイズを超えた場合に自動出力を行うか|true|
|import|インポートするパッケージ／クラス(複数指定の場合はカンマ区切り)|java.lang.\*, javax.servlet.\*, javax.servlet.jsp.\*, javax.servlet.http.\*|
|errorPage|例外発生時に表示するエラーページのパス|-|
|isErrorPage|現在のページがエラーページであるかどうか|false|
|isELIgnored|式言語を無視するか|false|
|session|セッション機能を使用するか|true|
|info|ページに関するメモ情報|-|
|language|使用している言語|java(固定)|

## リクエスト情報

### ポストデータの取得

- String getParameter(String name)
	- name: 名前
		- 指定された名前に対応する値を取得する。名前は<input\>、<select\>タグなどで  
		指定されたnameオプションの値

- String[] getParameterValues(String name)
	- name: 名前
		- 指定された名前に対応する値を文字列の配列として取得する。指定された要素が存在し  
		ない場合にはnullを返す

### ポストデータとクエリ情報

1. クエリ情報では送信できるデータサイズに制限がある
1. クエリ情報ではデータがアドレス欄に露出してしまう
1. POST経由で得た情報をブックマークすることはできない

### リダイレクト

``` java
<%
response.sendRedirect("http://www.wings- .msn.to");
%>
```

### クッキー

- Cookie(String name, String value) - コンストラクタ
	- name: クッキー名
	- value: クッキー値
		- 指定された名前と値の組み合わせで、Cookieオブジェクトを生成する

- addCookie(Cookei cok)
	- cok: クッキー
		- 指定されたクッキーをクライアントに送信/記録する

- Cookie[] getCookies()
	- クライアントに保存されたすべてのクッキーを取得する。  
	クラアントに保存されたクッキーが存在しない場合は、nullを返す

### セッション情報

- sessionオブジェクト
	- Object getAttribute(String name)
	- void setAttribute(String name, Object object)
		- name: キー名
		- Object: 値
			- セッション情報の取得/設定
	- void invalidate()
		- セッションを明示的に廃棄
	- void setMaxInactiveInterval(秒単位)
		- セッションの有効期限を設定する