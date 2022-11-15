package db;

public class Order {
	String place;
	public double k;
	public int idx;
	public Order(String place, double k, int idx) {
		this.place = place;
		this.k = k;
		this.idx = idx;
	}
	
	public double getK() {
		return this.k;
	}
	
	public String getPlace() {
		return this.place;
	}
	
	public int getIdx() {
		return this.idx;
	}
	
}

