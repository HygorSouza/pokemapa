<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Exibir Local</title>

<link href="res/css/bootstrap.min.css" rel="stylesheet">
<link href="res/css/style.css" rel="stylesheet">
</head>

<body>
	<!-- Modal -->
	<jsp:include page="modal_excluir_local.jsp" />
	<!-- /.modal -->

	<!-- Barra superior com os menus de navegação -->
	<jsp:include page="navbar.jsp" />
	<!-- Container Principal -->
	<div id="main" class="container">
		<h3 class="page-header">Exibir Local #${local.id }</h3>
		<div class="row">
			<div class="col-md-8">
				<div class="row">
					<div class="col-md-8">
						<p>
							<strong>Nome</strong>
						</p>
						<p>${local.nome}</p>
					</div>
					<div class="col-md-4">
						<p>
							<strong>Tipo</strong>
						</p>
						<p>${local.tipo.nome}</p>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<p>
							<strong>Logradouro</strong>
						</p>
						<p>${local.logradouro}</p>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<p>
							<strong>Latitude</strong>
						</p>
						<p>${local.latitude}</p>
					</div>
					<div class="col-md-4">
						<p>
							<strong>Longitude</strong>
						</p>
						<p>${local.longitude}</p>
					</div>
					<div class="col-md-4">
						<p>
							<strong>Cidade</strong>
						</p>
						<p>${local.cidade.nome}-${local.cidade.estado.id}</p>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<c:choose>
					<c:when test="${ not empty local.imagem}">
						<img alt="?" src="res/img/${local.imagem}" class="img-responsive">
					</c:when>
					<c:otherwise>
						<div></div>
					</c:otherwise>
				</c:choose>

			</div>
		</div>
		<hr />
		<div id="actions" class="row">
			<div class="col-md-12">
				<a href="alterar_local?id=${local.id }" class="btn btn-primary">Alterar</a>
				<a href="#" class="btn btn-danger" data-toggle="modal"
					data-local="${local.id}" data-target="#delete-modal">Excluir</a> <a
					href="listar_locais" class="btn btn-default">Voltar</a>
			</div>
		</div>
	</div>
	<script src="res/js/jquery.min.js"></script>
	<script src="res/js/bootstrap.min.js"></script>
	<script src="res/js/excluir_local.js"></script>
</body>

</html>