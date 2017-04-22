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
<title>Novo Local</title>

<link href="res/css/bootstrap.min.css" rel="stylesheet">
<link href="res/css/style.css" rel="stylesheet">
</head>

<body>
	<!-- Barra superior com os menus de navegação -->
	<jsp:include page="navbar.jsp"/>
	<!-- Container Principal -->
	<div id="main" class="container">
		<h3 class="page-header">Incluir Local</h3>
		<!-- Formulario para inclusao de locais -->
		<form action="incluir_local" method="post" enctype="multipart/form-data">
			<!-- area de campos do form -->
			<div class="row">
				<div class="form-group col-md-8">
					<label for="nome">Nome</label> 
					<input type="text" class="form-control" name="nome" id="nome" required maxlength="128" placeholder="nome do local">
					<form:errors path="local.nome" cssStyle="color:red" />
				</div>
				<div class="form-group col-md-4">
					<label for="tipo">Tipo</label> 
					<select name="tipo.id" class="form-control">
						<c:forEach var="tipo" items="${tipos}">
							<option value="${tipo.id}">${tipo.nome}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-12">
					<label for="logradouro">Logradouro</label> 
					<input type="text" class="form-control" name="logradouro" id="logradouro" required maxlength="128" placeholder="nome do logradouro, sem cidade e estado">
					<form:errors path="local.logradouro" cssStyle="color:red" />
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-4">
					<label for="latitude">Latitude</label> 
					<input type="number" class="form-control" name="latitude" id="latitude" step="0.000001"  readonly value="0" placeholder="latitude do local">
					<form:errors path="local.latitude" cssStyle="color:red" />
				</div>
				<div class="form-group col-md-4">
					<label for="longitude">Longitude</label> 
					<input type="number" class="form-control" name="longitude" id="longitude" step="0.000001"  readonly value="0" placeholder="longitude do local">
					<form:errors path="local.longitude" cssStyle="color:red" />
				</div>
				<div class="form-group col-md-4">
					<label for="cidade">Cidade: </label>
					<select id="cidade" name="cidade.id" class="form-control">
						<c:forEach items="${cidades}" var="cidade">
							<option value="${cidade.id}">${cidade.nome} - ${cidade.estado.id}</option> 
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-8">
			<label for="arquivo">Por favor, selecione um arquivo de imagem do tipo jpg para carregar:</label> 
    	       <input type="file" name="file"  id="arquivo" class="file"/>
    	       </div>
    	       </div>
			<hr />
			<div id="actions" class="row">
				<div class="col-md-12">
					<button type="submit" class="btn btn-primary">Salvar</button>
					<a href="index" class="btn btn-default">Cancelar</a>
				</div>
			</div>
		</form>
	</div>
	<script src="res/js/jquery.min.js"></script>
	<script src="res/js/bootstrap.min.js"></script>
</body>

</html>