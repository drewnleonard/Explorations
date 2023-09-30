//
//  PlanPageFlight.swift
//  Explorations
//
//  Created by Drew Leonard on 9/4/23.
//

import SwiftUI

struct PlanPageCarRental: View {
  
  var plan: Trip.Itinerary.Plan
  var carRental: Trip.Itinerary.Plan.CarRentalMetadata
  
  var body: some View {
    
    VStack {
      ScrollView {
        
        // Header
        PlanPageHeader(
          plan: plan,
          title: "\(carRental.rentalCompany) Rental",
          subtitleLeft: "\(convertDateToShorthandEnglish(dateString: carRental.pickUp.date))",
          subtitleRight: ""
        )
        
        // 30px spacing
        Spacer()
          .frame(height: 30)
        
        // Pick up details
        PlanPageCard(
          title: convertDateToShorthandEnglish(dateString: carRental.pickUp.date),
          subtitleOne: carRental.pickUp.location,
          subtitleTwo: "",
          time: carRental.pickUp.time,
          timezone: carRental.pickUp.timezone,
          icon: "arrow.up.right.circle.fill",
          last: false
        )

        // Drop off details
        PlanPageCard(
          title: convertDateToShorthandEnglish(dateString: carRental.dropOff.date),
          subtitleOne: carRental.dropOff.location,
          subtitleTwo: "",
          time: carRental.dropOff.time,
          timezone: carRental.dropOff.timezone,
          icon: "arrow.down.right.circle.fill",
          last: true
        )
        .offset(x: 0, y: -15)

        // Additional details
        HStack {
          Text("Details")
            .font(.subheadline)
            .foregroundColor(.gray)
            .bold()
            .frame(maxWidth: .infinity, alignment: .leading)
          Button("Edit") {}
            .font(.subheadline)
            .foregroundColor(.blue)
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity)

        NavigationView {
          VStack {
            List {
              PlanPageDetail(detailType: "Confirmation", detail: carRental.confirmationCode, copyButton: true)
              PlanPageDetail(detailType: "Class", detail: carRental.carClass, copyButton: false)
              PlanPageDetail(detailType: "Rental Company", detail: "\(carRental.rentalCompany)",  copyButton: false)
            }
            .padding(.horizontal, -5)
            .offset(x: 0, y: -30)
            .edgesIgnoringSafeArea(.bottom)
          }
        }

      }
    }
  }
}

struct PlanPageCarRental_Previews: PreviewProvider {
  static var previews: some View {
    let mockPlan = Trip.Itinerary.Plan()
    let mockPlanCarRental = Trip.Itinerary.Plan.CarRentalMetadata()
    PlanPageCarRental(plan: mockPlan, carRental: mockPlanCarRental)
      .preferredColorScheme(.dark)
  }
}
