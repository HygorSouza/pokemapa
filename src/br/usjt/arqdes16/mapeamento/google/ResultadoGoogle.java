package br.usjt.arqdes16.mapeamento.google;

import java.util.Arrays;

public class ResultadoGoogle {
	private Resultado[] results;
	private String status;
	public Resultado[] getResults() {
		return results;
	}
	public void setResults(Resultado[] results) {
		this.results = results;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "ResultadoGoogle [results=" + Arrays.toString(results)
				+ ", status=" + status + "]";
	}
	public Localizacao getLocalizacao() {
		Localizacao localizacao = getFirstLocation();
		return localizacao;
	}
	public Localizacao getFirstLocation() {
		return results[0].getGeometry().getLocation();
	}
	public String getEnderecoFormatado() {
		return results[0].getFormatted_address();
	}
	

}
