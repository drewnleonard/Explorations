//
//  File.swift
//  Explorations
//
//  Created by Drew Leonard on 8/25/23.
//

import Foundation
import SwiftUI
import CoreLocation

struct Trip: Hashable, Codable, Identifiable {
  
  struct Itinerary: Hashable, Codable {
    
    var id: Int = 0
    var date: String = "2023-10-13"
    var plans: [Plan]
    
    struct Plan: Hashable, Codable {
      
      var id: Int = 0
      var planType: String = "flight"
      
      var flightMetadata: FlightMetadata? = FlightMetadata()
      
      struct FlightMetadata: Hashable, Codable {
        
        var number: String = "UA 1893"
        var confirmationCode: String = "WA4QU7"
        var seatNumber: String = "33B"
        var seatSection: String = "Economy"
        var boardingTime: String = "6:59 AM"
        
        var distance: Distance = Distance()
        var departure: Departure = Departure()
        var arrival: Arrival = Arrival()
        
        struct Distance: Hashable, Codable {
          var miles: String = "226 mi"
          var time: String = "2h 35m"
        }
        
        struct Departure: Hashable, Codable {
          var date: String = "2023-10-13"
          var time: String = "7:34 AM"
          var timezone: String = "PST"
          var airportName: String = "San Francisco Intl"
          var airportCode: String = "SFO"
          var gate: String = "B2"
          var terminal: String = "2"
        }
        
        struct Arrival: Hashable, Codable {
          var date: String = "2023-10-13"
          var time: String = "9:29 AM"
          var timezone: String = "MST"
          var airportName: String = "Denver Intl"
          var airportCode: String = "DEN"
          var gate: String = "E4"
          var terminal: String = "2"
        }
      }
      
      // Car rental metadata
      var carRentalMetadata: CarRentalMetadata? = CarRentalMetadata()

      struct CarRentalMetadata: Hashable, Codable {
        var rentalCompany: String = "Hertz"
        var confirmationCode: String = "JN8KU4"
        var carClass: String = "Economy"
        var pickUp: PickUp = PickUp()
        var dropOff: DropOff = DropOff()
        
        struct PickUp: Hashable, Codable {
          var date: String = "2023-09-28"
          var time: String = "9:00 PM"
          var timezone: String = "MST"
          var location: String = "Denver Intl"
        }
        
        struct DropOff: Hashable, Codable {
          var date: String = "2023-09-28"
          var time: String = "9:00 PM"
          var timezone: String = "MST"
          var location: String = "Denver Intl"
        }
      }
      
      var planIcon: String {
        switch planType {
        case "flight":
          return "airplane.circle.fill"
        case "carReservation":
          return "car.circle.fill"
        case "hotelReservation":
          return "bed.double.circle.fill"
        case "dinnerReservation":
          return "fork.knife.circle.fill"
        default:
          return "questionmark.circle.fill"
        }
      }
    }
    
  }
  
  var id: Int
  var destination: String
  var startDate: String
  var endDate: String
  var itinerary: [Itinerary]
  
  var daysOfTrip: Int {
    return itinerary.count
  }
  
  var daysUntilTrip: String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    
    if let start = dateFormatter.date(from: startDate) {
      let daysUntilTrip = Calendar.current.dateComponents([.day], from: Date(), to: start).day ?? 0
      return String(daysUntilTrip)
    }
    return "N/A"
  }
  
  var datesOfTrip: String {
    let inputFormatter = DateFormatter()
    inputFormatter.dateFormat = "yyyy-MM-dd"
    
    if let start = inputFormatter.date(from: startDate),
       let end = inputFormatter.date(from: endDate) {
      
      let calendar = Calendar.current
      
      let startComponents = calendar.dateComponents([.day, .month, .year], from: start)
      let endComponents = calendar.dateComponents([.day, .month, .year], from: end)
      
      let outputFormatter = DateFormatter()
      outputFormatter.dateFormat = "MMM d"
      
      let startFormatted = outputFormatter.string(from: start)
      let endFormatted = outputFormatter.string(from: end)
      
      // Same month and year
      if startComponents.month == endComponents.month && startComponents.year == endComponents.year {
        outputFormatter.dateFormat = "d"
        let endDay = outputFormatter.string(from: end)
        return "\(startFormatted) to \(endDay), \(startComponents.year!)"
      }
      // Different month, same year
      else if startComponents.year == endComponents.year {
        return "\(startFormatted) to \(endFormatted), \(startComponents.year!)"
      }
      // Different month, different year
      else {
        outputFormatter.dateFormat = "MMM d, yyyy"
        let endFormattedWithYear = outputFormatter.string(from: end)
        return "\(startFormatted), \(startComponents.year!) to \(endFormattedWithYear)"
      }
    }
    
    return "N/A"
  }
  
  var daysUntilTripFormatted: String {
    return "In \(daysUntilTrip) days"
  }
  
}
