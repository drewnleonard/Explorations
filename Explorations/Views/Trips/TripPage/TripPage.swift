//
//  TripPage.swift
//  Explorations
//
//  Created by Drew Leonard on 9/4/23.
//

import SwiftUI

func convertDate(from inputFormat: String, to outputFormat: String, originalDate: String) -> String? {
  let dateFormatter = DateFormatter()
  dateFormatter.dateFormat = inputFormat
  
  if let date = dateFormatter.date(from: originalDate) {
    dateFormatter.dateFormat = outputFormat
    return dateFormatter.string(from: date)
  }
  
  return nil
}

struct TripPage: View {
  
  var trip: Trip
  
  var body: some View {
    
    ScrollView {
      
      VStack(spacing: 30) {
        
        // Subheader
        HStack {
          Text(trip.datesOfTrip)
            .frame(alignment: .leading)
            .font(.subheadline)
            .foregroundColor(.gray)
          Spacer()
        }
        
        // Buttons
        HStack {
          
          // Button #1
          Button(action: {
          }) {
            HStack {
              Image(systemName: "square.and.arrow.up")
                .foregroundColor(.white)
              Text("Share")
                .foregroundColor(.white)
            }
            .padding(.horizontal, 14)
            .padding(.vertical, 8)
          }
          .background(Color.blue)
          .cornerRadius(20)
          
          // Button #2
          Button(action: {
          }) {
            HStack {
              Image(systemName: "bell.fill")
                .foregroundColor(.white)
              Text("Alerts")
                .foregroundColor(.white)
            }
            .padding(.horizontal, 14)
            .padding(.vertical, 8)
          }
          .background(RoundedRectangle(cornerRadius: 20)
            .stroke(Color.gray, lineWidth: 1))
          
          // Button #3
          Button(action: {
          }) {
            HStack {
              Image(systemName: "ellipsis")
                .foregroundColor(.white)
              Text("More")
                .foregroundColor(.white)
            }
            .padding(.horizontal, 14)
            .padding(.vertical, 8)
          }
          .background(RoundedRectangle(cornerRadius: 20)
            .stroke(Color.gray, lineWidth: 1))
          
          // Space to fill View
          Spacer()
          
        }
        
        // Trip plans
        LazyVStack(alignment: .leading, spacing: 0, pinnedViews: [.sectionHeaders]) {
          
          ForEach(trip.itinerary, id: \.date) { day in
            
            // Convert each date
            let formattedDate = convertDate(
              from: "yyyy-MM-dd",
              to: "EEE, MMM dd",
              originalDate: day.date
            ) ?? "Invalid Date"
            
            // Section for each date
            Section {
              
              // Card for each plan
              ForEach(day.plans, id: \.id) { plan in
                NavigationLink(
                  destination: PlanPage(plan: plan)
                ) {
                  PlanCard(plan: plan)
                }
              }
              // Plan header
            } header: {
              HStack {
                Text(formattedDate)
                  .font(.title)
                  .foregroundColor(.white)
                  .bold()
                Spacer()
                Text("Day \(day.id) of \(trip.daysOfTrip)")
                  .font(.subheadline)
                  .foregroundColor(.gray)
              }
              .padding(.vertical, 20)
              .frame(maxWidth: .infinity, alignment: .leading)
              .background(Color(UIColor.systemBackground))
            }
          }
        }
      }
      .padding(.horizontal, 15)
    }
  }
}

struct TripPage_Previews: PreviewProvider {
  
  static var previews: some View {
    TripPage(trip: ModelData().trips[0])
    .preferredColorScheme(.dark)
  }
}


