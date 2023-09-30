//
//  PlanPage.swift
//  Explorations
//
//  Created by Drew Leonard on 9/1/23.
//

import SwiftUI

struct PlanPage: View {
  
  var plan: Trip.Itinerary.Plan
  
  var body: some View {
    
    switch plan.planType {
    case "flight":
      if let flightMetadata = plan.flightMetadata {
        PlanPageFlight(plan: plan, flight: flightMetadata)
      } else {
        Text("N/A")
      }
    case "carRental":
      if let carRentalMetadata = plan.carRentalMetadata {
        PlanPageCarRental(plan: plan, carRental: carRentalMetadata)
      } else {
        Text("N/A")
      }
    default:
      Text("N/A")
    }
    
  }
}

struct PlanPage_Previews: PreviewProvider {
  static var previews: some View {
    let mockPlan = Trip.Itinerary.Plan()
    PlanPage(plan: mockPlan)
      .preferredColorScheme(.dark)
  }
}
