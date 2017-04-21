package br.usjt.arqdes16.mapeamento.google;

public class Endereco {
	private final String PAIS = "Brasil";
	private String logradouro;
	private String cidade;
	private String estado;
	public String getLogradouro() {
		return logradouro;
	}
	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}
	public String getCidade() {
		return cidade;
	}
	public void setCidade(String cidade) {
		this.cidade = cidade;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public String getPais() {
		return PAIS;
	}
}
