<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>AJAX FRONT</title>
	</head>
	<body>
		<div>
			<h1>AJAX FRONT</h1>
		</div>
		<div>
			<form>
				<input type="text" id="message" placeholder="메세지"><br>
				<input type="button" id="btnSend" value="전송">
			</form>
		</div>
		<div id="result"></div>
		<script>
			const request = async () => {
				try {
					const message = document.getElementById('message').value.trim();
					const obj = {
						msg: message
					};
					const params = new URLSearchParams({
						data: JSON.stringify(obj)
					});
					const response = await fetch(`http://192.168.0.8:8081/BACK/api/test?${params}`);
					const data = await response.json();
					console.log(data);
					document.getElementById('result').innerHTML = data.msg;
				} catch(e) {
					console.log(e);
				}
			};
			document.getElementById('btnSend').addEventListener('click', request);
		</script>
	</body>

</html>
