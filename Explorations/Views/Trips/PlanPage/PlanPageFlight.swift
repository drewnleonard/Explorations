//
//  PlanPageFlight.swift
//  Explorations
//
//  Created by Drew Leonard on 9/4/23.
//

import SwiftUI

struct PlanPageFlight: View {
  
  var plan: Trip.Itinerary.Plan
  var flight: Trip.Itinerary.Plan.FlightMetadata
  
  var body: some View {
    
    VStack {
      ScrollView {
        
        // Header
        PlanPageHeader(
          plan: plan,
          title: "\(flight.departure.airportCode) → \(flight.arrival.airportCode)",
          subtitleLeft: "\(flight.number) • ֯\(flight.departure.date)",
          subtitleRight: "\(flight.distance.time) ֯\(flight.distance.miles)"
        )
        
        // 30px spacing
        Spacer()
          .frame(height: 30)
        
        // Departure details
        PlanPageCard(
          title: flight.departure.airportCode,
          subtitleOne: flight.departure.airportName,
          subtitleTwo: "Gate \(flight.departure.gate)",
          time: flight.departure.time,
          timezone: flight.departure.timezone,
          icon: "arrow.up.right.circle.fill",
          last: false
        )
        
        // Arrival details
        PlanPageCard(
          title: flight.arrival.airportCode,
          subtitleOne: flight.arrival.airportName,
          subtitleTwo: "Gate \(flight.arrival.gate)",
          time: flight.arrival.time,
          timezone: flight.arrival.timezone,
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
              PlanPageDetail(detailType: "Confirmation", detail: flight.confirmationCode, copyButton: true)
              PlanPageDetail(detailType: "Boarding", detail: flight.boardingTime, copyButton: false)
              PlanPageDetail(detailType: "Gate", detail: "Gate \(flight.departure.gate)",  copyButton: false)
              PlanPageDetail(detailType: "Terminal", detail: "Terminal \(flight.departure.terminal)", copyButton: false)
              PlanPageDetail(detailType: "Seat", detail: "\(flight.seatNumber), \(flight.seatSection)", copyButton: false)
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

struct PlanPageFlight_Previews: PreviewProvider {
  static var previews: some View {
    let mockPlan = Trip.Itinerary.Plan()
    let mockPlanFlight = Trip.Itinerary.Plan.FlightMetadata()
    PlanPageFlight(plan: mockPlan, flight: mockPlanFlight)
      .preferredColorScheme(.dark)
  }
}
