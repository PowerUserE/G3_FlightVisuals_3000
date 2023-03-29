public class getData {
  public int carrierDistance(String carrier) {
    int totalDistance = 0;
    for (int i = 1; i<mktCarrier.size(); i++) {
      if (mktCarrier.get(i).equals(carrier)) {
        totalDistance += distance.get(i);
      }
    }
    println("Total distance for carrier " + carrier + ": " + totalDistance);
    return totalDistance;
  }

  public int destCityCancelledFlights(String destCityCancelQuery) {
    int count = 0;
    for (int i = 0; i < destCity.size(); i++) {
      if ((destCity.get(i).equals(destCityCancelQuery)) && (cancelled.get(i) != 0.0)) {
        count++;
      }
    }
    println("Total cancelled flights for  " + destCityCancelQuery + ": " + count);
    return count;
  }

  public int cityOutboundFlightByDate(String originStateQuery, String flightDateQuery) { // how many flights left a particular city at a certain date
    int count = 0;
    for (int i = 0; i < destCity.size(); i++) {
      if ((originCity.get(i).equals(originStateQuery)) && (flightDate.get(i).equals(flightDateQuery))) {
        count++;
      }
    }
     println("Total outbound flights for  " + originStateQuery + ": " + count);
    return count;
  }
}
