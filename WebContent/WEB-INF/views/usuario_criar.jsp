<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Cadastro de usuario</title>

<link href="res/css/bootstrap.min.css" rel="stylesheet">
<link href="res/css/style.css" rel="stylesheet">
</head>

<body>
	<!-- Barra superior com os menus de navegação -->
	<jsp:include page="menu.jsp" />
	<!-- Container Principal -->
	<div id="main" class="container">
		<h3 class="page-header">Cadastro de usuario</h3>
		<!-- Formulario para inclusao de locais -->
		<form action="criar_usuario" method="post" onsubmit="return valida()">
			<!-- area de campos do form -->
			<c:if test="${ not empty usuarioExistente}">
				<div class="alert alert-danger row col-md-8">
					Email: ${usuarioExistente} ja está cadastrado!
				</div>
			</c:if>
			<!-- area de campos do form -->
			<div class="row col-md-12">
				<div class="form-group">
					<div class="input-group col-md-4">
						<div class="input-group-addon">
							<span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
						</div>
						<input type="email" name="username" id="username" class="form-control" maxlength="60" placeholder="E-mail" required />
					</div>
				</div>
				<div class="form-group">
					<div class="input-group col-md-4">
						<div class="input-group-addon">
							<span class="glyphicon glyphicon-option-horizontal" aria-hidden="true"></span>
						</div>
						<input type="password" name="password" id="password" class="form-control" placeholder="Senha" required />
					</div>
				</div>

				<div class="form-group">
					<div class="input-group col-md-4">
						<div class="input-group-addon">
							<span class="glyphicon glyphicon-option-horizontal"
								aria-hidden="true"></span>
						</div>
						<input type="password" name="password2" id="password2"
							class="form-control" placeholder="Confirmar senha" required />
					</div>
				</div>
			</div>

			<hr />
			<div id="actions" class="row">
				<div class="col-md-12">
					<button type="submit" class="btn btn-primary">Registrar</button>
					<a href="loginForm" class="btn btn-default">Cancelar</a>
				</div>
			</div>
		</form>
	</div>
	<script src="res/js/jquery.min.js"></script>
	<script src="res/js/bootstrap.min.js"></script>
	<script>
		$(document).ready(function(){
			
		})
		function valida() {

			var pws = $("#password").val();
			var pws2 = $("#password2").val();
			if (pws != pws2) {
				alert("Senha informada não está compativel")
				return false;
			}
			return true;
		}
	</script>
</body>
</html>