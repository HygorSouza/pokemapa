package br.usjt.arqdes16.mapeamento.google;

public class Bounds {
	private Localizacao northeast;
	private Localizacao southwest;
	public Localizacao getNortheast() {
		return northeast;
	}
	public void setNortheast(Localizacao northeast) {
		this.northeast = northeast;
	}
	public Localizacao getSouthwest() {
		return southwest;
	}
	public void setSouthwest(Localizacao southwest) {
		this.southwest = southwest;
	}
	@Override
	public String toString() {
		return "Bounds [northeast=" + northeast + ", southwest=" + southwest
				+ "]";
	}
}
