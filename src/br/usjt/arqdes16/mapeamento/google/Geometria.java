package br.usjt.arqdes16.mapeamento.google;

public class Geometria {
	private Bounds bounds;
	private Localizacao location;
	private String location_type;
	private Bounds viewport;
	public Bounds getBounds() {
		return bounds;
	}
	public void setBounds(Bounds bounds) {
		this.bounds = bounds;
	}
	public Localizacao getLocation() {
		return location;
	}
	public void setLocation(Localizacao location) {
		this.location = location;
	}
	public String getLocation_type() {
		return location_type;
	}
	public void setLocation_type(String location_type) {
		this.location_type = location_type;
	}
	public Bounds getViewport() {
		return viewport;
	}
	public void setViewport(Bounds viewport) {
		this.viewport = viewport;
	}
	@Override
	public String toString() {
		return "Geometria [bounds=" + bounds + ", location=" + location
				+ ", location_type=" + location_type + ", viewport=" + viewport
				+ "]";
	}
}
