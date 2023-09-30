//
//  TripsDrawer.swift
//  Explorations
//
//  Created by Drew Leonard on 8/13/23.
//

import SwiftUI

struct TripsDrawer: View {
  
  @State private var isSheetPresented = true
  @State private var isTripPagePresented = false
  @State private var searchText = ""
  @State private var selectedTrip: Trip?
  @State private var selectedTripIndex: Int?
  
  @ObservedObject var modelData: ModelData
  
  struct BackButtonX: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
      Button(action: {
        self.presentationMode.wrappedValue.dismiss()
      }) {
        HStack {
          Spacer()
          Image(systemName: "x.circle.fill")
            .foregroundColor(Color.gray)
        }
      }
    }
  }
  
  var body: some View {
    Button("Show Trips") {
      isSheetPresented.toggle()
    }
    .sheet(isPresented: $isSheetPresented) {
      VStack {
        NavigationView {
          List {
            ForEach(modelData.trips.indices, id: \.self) { index in
              let trip = modelData.trips[index]
              NavigationLink(
                destination: TripPage(trip: trip)
                  .navigationBarBackButtonHidden(true)
                  .navigationBarItems(
                    leading: VStack(alignment: .leading) {},
                    trailing: BackButtonX()
                  )
                  .navigationBarTitle(trip.destination, displayMode: .large),
                tag: index,
                selection: $selectedTripIndex
              ) {
                TripDrawerCard(
                  trip: trip,
                  onTap: {
                    selectedTrip = trip
                    selectedTripIndex = index
                  }
                )
              }
            }
          }
          .listStyle(.plain)
          .searchable(text: $searchText)
          .navigationBarTitleDisplayMode(.inline)
          .toolbar {
            ToolbarItem(placement: .principal) {
              HStack {
                Text("My Trips")
                  .font(.title)
                  .bold()
                Image(systemName: "chevron.down")
                  .padding(.leading, 10)
                  .bold()
              }
              .frame(maxWidth: .infinity, alignment: .leading)
              Spacer()
            }
          }
        }
        .padding(.top)
        .preferredColorScheme(.dark)
      }
    }
  }
}

struct TripsDrawer_Previews: PreviewProvider {
  static var previews: some View {
    TripsDrawer(modelData: ModelData())
      .preferredColorScheme(.dark)
  }
}
