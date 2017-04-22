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
<title>Pokestops e Ginásios</title>

<link href="res/css/bootstrap.min.css" rel="stylesheet">
<link href="res/css/style.css" rel="stylesheet">

</head>

<body>
	<!-- Modal -->
	<jsp:include page="modal_excluir_local.jsp"/>

	<!-- /.modal -->
	<!-- Barra superior com os menus de navegação -->
	<jsp:include page="navbar.jsp"/>
	<!-- Container Principal -->
	<div id="main" class="container-fluid">
		<form action="listar_locais" method="post">
			<div id="top" class="row">
				<div class="col-md-3">
					<h2>Locais</h2>
				</div>

				<div class="col-md-6">
					<div class="input-group h2">
						<input name="chave" class="form-control" id="search" type="text" placeholder="Pesquisar Locais (deixe vazio para trazer todos)">
						<span class="input-group-btn">
							<button class="btn btn-primary" type="submit">
								<span class="glyphicon glyphicon-search"></span>
							</button>
						</span>
					</div>
				</div>

				<div class="col-md-3">
					<a href="novo_local" class="btn btn-primary pull-right h2">Novo Local</a>
				</div>
			</div>
			<!-- /#top -->
		</form>
		<hr />
		<c:if test="${not empty locais}">
			<div id="list" class="row">

				<div class="table-responsive col-md-12">
					<table class="table table-striped">
						<thead>
							<tr>
							    <th>Foto</th>
								<th>ID</th>
								<th>Nome</th>
								<th>Tipo</th>
								<th>Endereço</th>
								<th>Latitude</th>
								<th>Longitude</th>
								<th class="actions">A&ccedil;&otilde;es</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="local" items="${locais}">
								<tr id="local_${local.id}">
									<td><img alt="?" src="res/img/${local.imagem}"  height="48" width="48" class="img-circle"></td>
									<td>${local.id }</td>
									<td>${local.nome }</td>
									<td>${local.tipo.nome }</td>
									<td>${local.logradouro }</td>
									<td>${local.latitude }</td>
									<td>${local.longitude }</td>
									<td class="actions">
										<a class="btn btn-success btn-xs" href="mostrar_local?id=${local.id }">Exibir</a> 
										<a class="btn btn-warning btn-xs" href="alterar_local?id=${local.id }">Alterar</a>
										<button type="button" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#delete-modal" data-local="${local.id }">Excluir</button>
									</td>
								</tr>
							</c:forEach>

						</tbody>
					</table>

				</div>
			</div>
			<!-- /#list -->

		</c:if>
		<!-- /#bottom -->
	</div>
	<!-- /#main -->
	<script src="res/js/jquery.min.js"></script>
	<script src="res/js/bootstrap.min.js"></script>
	<script src="res/js/excluir_local.js"></script>
</body>
</html>