//
//  PlanCardLarge.swift
//  Explorations
//
//  Created by Drew Leonard on 9/1/23.
//

import SwiftUI

struct PlanPageCard: View {
    
    var title: String
    var subtitleOne: String
    var subtitleTwo: String
    var time: String
    var timezone: String
    var icon: String
    var last: Bool
    
    var body: some View {
        HStack(alignment: .top) {
            VStack {
                Image(systemName: icon)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .offset(y: 5)
                switch last {
                case false:
                    Rectangle()
                        .frame(width: 1, height: 65)
                        .foregroundColor(Color(red: 57/255, green: 56/255, blue: 61/255))
                case true:
                    EmptyView()
                }
            }
            Spacer()
                .frame(width: 14)
            VStack {
                HStack {
                    Text(title)
                    Spacer()
                    Text(time)
                }
                .font(.title)
                .bold()
                HStack {
                    Text(subtitleOne)
                    Spacer()
                    Text(timezone)
                }
                .font(.subheadline)
                .foregroundColor(.gray)
                .bold()
                HStack {
                    Text(subtitleTwo)
                    Spacer()
                }
                .font(.subheadline)
                .foregroundColor(.gray)
                .bold()
                
                switch last {
                case false:
                    Spacer()
                        .frame(height: 15)
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(Color(red: 57/255, green: 56/255, blue: 61/255))
                case true:
                    EmptyView()
                }
            }
        }
        .padding(.horizontal, 15)
    }
}

struct PlanCardLarge_Previews: PreviewProvider {
    static var previews: some View {
        PlanPageCard(
            title: "SFO",
            subtitleOne: "UA 1863",
            subtitleTwo: "Gate D1",
            time: "7:00 AM",
            timezone: "PST",
            icon: "arrow.up.right.circle.fill",
            last: false
        )
        .preferredColorScheme(.dark)
    }
}
