package db;

public class Distance {
	public String place;
	float lat;
	float lng;
	float dist;
	public Distance(String place, float lat, float lng){
		this.place = place;
		this.lat = lat;
		this.lng = lng;
	}
	
	public void setDist(float dist) {
		this.dist = dist;
	}
	
	public String getPlace() {
		return this.place;
	}
	public float getLat() {
		return this.lat;
	}
	public float getLng() {
		return this.lng;
	}
}
