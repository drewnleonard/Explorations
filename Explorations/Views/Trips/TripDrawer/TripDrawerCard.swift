//
//  TripCard.swift
//  Explorations
//
//  Created by Drew Leonard on 8/13/23.
//

import SwiftUI

struct TripDrawerCard: View {
  
  var trip: Trip
  var onTap: () -> Void
  
  private func getPadding() -> CGFloat {
    if trip.daysUntilTrip.count == 3 {
      return 22
    } else {
      return 30
    }
  }
  
  var body: some View {
    HStack {
      VStack {
        Text(trip.daysUntilTrip)
          .font(.title)
          .bold()
        Text("DAYS")
          .foregroundColor(Color(hex: 0x96969E))
      }
      .padding(.trailing, getPadding())
      VStack {
        Text(trip.destination)
          .font(.title)
          .bold()
        Text(trip.daysOfTrip)
      }
    }
    .onTapGesture {
      onTap()
    }
  }
}

struct TripCard_Previews: PreviewProvider {
  static var previews: some View {
    TripDrawerCard(trip: ModelData().trips[0]) {}
      .preferredColorScheme(.dark)
  }
}
