package br.usjt.arqdes16.mapeamento.google;

import java.util.Arrays;


public class Resultado {
	private ComponentesEndereco[] address_components;
	private String formatted_address;
	private Geometria geometry;
	private String place_id;
	String[] types;
	public ComponentesEndereco[] getAddress_components() {
		return address_components;
	}
	public void setAddress_components(ComponentesEndereco[] address_components) {
		this.address_components = address_components;
	}
	public String getFormatted_address() {
		return formatted_address;
	}
	public void setFormatted_address(String formatted_address) {
		this.formatted_address = formatted_address;
	}
	public Geometria getGeometry() {
		return geometry;
	}
	public void setGeometry(Geometria geometry) {
		this.geometry = geometry;
	}
	public String getPlace_id() {
		return place_id;
	}
	public void setPlace_id(String place_id) {
		this.place_id = place_id;
	}
	public String[] getTypes() {
		return types;
	}
	public void setTypes(String[] types) {
		this.types = types;
	}
	@Override
	public String toString() {
		return "Resultado [address_components="
				+ Arrays.toString(address_components) + ", formatted_address="
				+ formatted_address + ", geometry=" + geometry + ", place_id="
				+ place_id + ", types=" + Arrays.toString(types) + "]";
	}
}
