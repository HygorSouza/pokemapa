package br.usjt.arqdes16.mapeamento.service;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import br.usjt.arqdes16.mapeamento.google.Localizacao;
import br.usjt.arqdes16.mapeamento.google.ResultadoGoogle;
import br.usjt.arqdes16.mapeamento.model.Local;

@Service
public class GoogleService {
	private final String PAIS = "Brasil";
	private final String KEY = "key=AIzaSyBM94KJ_EYyq-TiaXfjt9oefskMh78jaGQ";
	private ResultadoGoogle resultadoGoogle;
	
	public ResultadoGoogle buscaGoogleMaps(Local local) {
		RestTemplate restTemplate = new RestTemplate();
		this.resultadoGoogle = restTemplate.getForObject( montaURL(local) , ResultadoGoogle.class );
		return resultadoGoogle;
	}
	
	private String montaURL(Local local) {
		final String SEPARADOR = ",";
		String url = "https://maps.googleapis.com/maps/api/geocode/json";
		String address = "address=" + local.getLogradouro() + SEPARADOR + local.getCidade().getNome() + SEPARADOR
				+ local.getCidade().getEstado().getNome() + SEPARADOR + PAIS;
		return url + "?" + address + "&" + KEY;
	}
	
	public Local getLocalizacao(ResultadoGoogle resultado , Local local) {
		Localizacao localizacao = resultado.getLocalizacao();
		local.setLatitude(localizacao.getLat());
		local.setLongitude(localizacao.getLng());
		local.setLogradouro(getEnderecoFormatado(resultado));
		return local;
	}
	
	private String getEnderecoFormatado(ResultadoGoogle resultado) {
		return resultado.getEnderecoFormatado();
	}
	
}
