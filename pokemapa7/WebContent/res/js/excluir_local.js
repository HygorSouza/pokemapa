/**
 * 
 */

$("#delete-modal").on('show.bs.modal', function(event) {
	var button = $(event.relatedTarget); // botao que disparou a modal
	var recipient = button.data('local');
	$("#id_excluir").val(recipient);
});
