//
//  PlanPageHeader.swift
//  Explorations
//
//  Created by Drew Leonard on 9/1/23.
//

import SwiftUI

func getPlanImage(plan: Trip.Itinerary.Plan) -> String {
  
  switch plan.planType {
  case "flight":
    return "logo-united"
  case "carRental":
    return "logo-hertz"
  default:
    return "N/A"
  }
  
}

struct PlanPageHeader: View {
  
  var plan: Trip.Itinerary.Plan
  var title: String
  var subtitleLeft: String
  var subtitleRight: String
  
  var body: some View {
    
    HStack(alignment: .top) {
      ZStack {
        Rectangle()
                .foregroundColor(.white)
                .frame(width: 50, height: 50)
        Image(getPlanImage(plan: plan))
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 50)
      }
      Spacer()
        .frame(width: 14)
      HStack(alignment: .top) {
        VStack(alignment: .leading) {
          Text(subtitleLeft)
            .font(.subheadline)
            .foregroundColor(.gray)
          Text(title)
            .font(.title)
            .bold()
          
        }
        Spacer()
        Text(subtitleRight)
          .font(.subheadline)
          .foregroundColor(.gray)
      }
    }
    .padding(.horizontal, 15)
    
  }
}

struct PlanPageHeader_Previews: PreviewProvider {
  static var previews: some View {
    let mockPlan = Trip.Itinerary.Plan()
    PlanPageHeader(plan: mockPlan, title: "SFO → DEN", subtitleLeft: "AS 870 Sat, Oct 13", subtitleRight: "2h 24m 224 mi")
      .preferredColorScheme(.dark)
  }
}
