package db;

public class LocationDistance {
	
	public static void main(String[] args) {

		// 마일(Mile) 단위
		//double distanceMile = 
		//	distance(37.504198, 127.047967, 37.501025, 127.037701);
		
		// 미터(Meter) 단위
		//double distanceMeter = 
			//distance(37.504198, 127.047967, 37.501025, 127.037701);
		
		// 킬로미터(Kilo Meter) 단위
		double distanceKiloMeter = 
			distance(37.504198, 127.047967, 37.501025, 127.037701,"kilometer");
	
		System.out.println(distanceKiloMeter) ;
		
		
	}
	
	private static double distance(double lat1, double lng1, double lat2, double lng2, String unit) {
		double theta = lng1-lng2;
		double dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2)) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));
		
		dist = Math.acos(dist);
		dist = rad2deg(dist);
		dist = dist * 60 * 1.1515 * 1.609344;
		

		return (dist); // 단위 meter
	}
	
	private static double deg2rad(double deg) { // 10진수를 라디안으로 변경
		return (deg * Math.PI / 180.0);
	}
	private static double rad2deg(double rad) { // 라디안을 10진수로 변경
		return (rad * 180 / Math.PI);
	}
}
