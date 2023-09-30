//
//  PlanCard.swift
//  Explorations
//
//  Created by Drew Leonard on 8/13/23.
//

import SwiftUI

func getPlanTitle(plan: Trip.Itinerary.Plan) -> String {
  switch plan.planType {
  case "flight":
    if let flightMetadata = plan.flightMetadata {
      return "\(flightMetadata.departure.airportCode) → \(flightMetadata.arrival.airportCode)"
    } else {
      return "N/A"
    }
  case "carRental":
    if let carRentalMetadata = plan.carRentalMetadata {
      return "\(carRentalMetadata.rentalCompany) Rental"
    } else {
      return "N/A"
    }
  default:
    return "N/A"
  }
}

func getPlanSubtitle(plan: Trip.Itinerary.Plan) -> String {
  
  switch plan.planType {
  case "flight":
    if let flightMetadata = plan.flightMetadata {
      return "\(flightMetadata.number)"
    } else {
      return "N/A"
    }
  case "carRental":
    if let carRentalMetadata = plan.carRentalMetadata {
      return "\(carRentalMetadata.pickUp.location)"
    } else {
      return "N/A"
    }
  default:
    return "N/A"
  }
}


func getPlanTime(plan: Trip.Itinerary.Plan) -> String {
  
  switch plan.planType {
  case "flight":
    if let flightMetadata = plan.flightMetadata {
      return "\(flightMetadata.departure.time)"
    } else {
      return "N/A"
    }
  case "carRental":
    if let carRentalMetadata = plan.carRentalMetadata {
      return "\(carRentalMetadata.pickUp.time)"
    } else {
      return "N/A"
    }
  default:
    return "N/A"
  }
}

func getPlanTimezone(plan: Trip.Itinerary.Plan) -> String {
  
  switch plan.planType {
  case "flight":
    if let flightMetadata = plan.flightMetadata {
      return "\(flightMetadata.departure.timezone)"
    } else {
      return "N/A"
    }
  case "carRental":
    if let carRentalMetadata = plan.carRentalMetadata {
      return "\(carRentalMetadata.pickUp.timezone)"
    } else {
      return "N/A"
    }
  default:
    return "N/A"
  }
}

func getPlanIcon(plan: Trip.Itinerary.Plan) -> String {
  
  switch plan.planType {
  case "flight":
    return "airplane.circle.fill"
  case "carRental":
    return "car.circle.fill"
  default:
    return "N/A"
  }
  
}

struct PlanCard: View {
  
  var plan: Trip.Itinerary.Plan
  
  var body: some View {
    HStack(alignment: .top) {
      Image(systemName: getPlanIcon(plan: plan))
        .resizable()
        .frame(width: 24, height: 24)
        .foregroundColor(Color.white)
        .offset(y: 5)
      Spacer()
        .frame(width: 14)
      VStack {
        HStack {
          VStack(alignment: .leading) {
            Text(getPlanTitle(plan: plan))
              .font(.title3)
              .bold()
              .foregroundColor(.white)
            Text(getPlanSubtitle(plan: plan))
              .foregroundColor(Color(hex: 0x96969E))
          }
          Spacer()
          VStack(alignment: .trailing) {
            Text(getPlanTime(plan: plan))
              .font(.title3)
              .bold()
              .foregroundColor(.white)
            Text(getPlanTimezone(plan: plan))
              .foregroundColor(Color(hex: 0x96969E))
          }
        }
        Spacer()
          .frame(height: 15)
        Rectangle()
          .frame(height: 1)
          .foregroundColor(Color(red: 57/255, green: 56/255, blue: 61/255))
        Spacer()
          .frame(height: 15)
      }
    }
  }
}

struct PlanCardNew_Previews: PreviewProvider {
  static var previews: some View {
    let mockPlan = Trip.Itinerary.Plan()
    PlanCard(plan: mockPlan)
      .preferredColorScheme(.dark)
  }
}
