package br.usjt.arqdes16.mapeamento.google;

public class Localizacao {
	private double lat;
	private double lng;
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public double getLng() {
		return lng;
	}
	public void setLng(double lng) {
		this.lng = lng;
	}
	@Override
	public String toString() {
		return "Localizacao [lat=" + lat + ", lng=" + lng + "]";
	}
}
