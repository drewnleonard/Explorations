//
//  helpers.swift
//  Explorations
//
//  Created by Drew Leonard on 9/8/23.
//

import Foundation

func convertDateToShorthandEnglish(dateString: String) -> String {
  let dateFormatter = DateFormatter()
  dateFormatter.dateFormat = "yyyy-MM-dd"
  let date = dateFormatter.date(from: dateString)
  dateFormatter.dateFormat = "EEE MMM, d"
  return dateFormatter.string(from: date!)
}
