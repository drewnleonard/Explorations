//
//  PlanCardDetail.swift
//  Explorations
//
//  Created by Drew Leonard on 9/1/23.
//

import SwiftUI

struct PlanPageDetail: View {
    
    var detailType: String
    var detail: String
    var copyButton: Bool
    
    var body: some View {
        
        HStack{
            VStack(alignment: .leading) {
                Text(detailType)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text(detail)
            }
            Spacer()
            
            switch copyButton {
            case true:
                Button(action: {
                }) {
                    Text("Copy")
                        .foregroundColor(.blue)
                }
            case false:
                EmptyView()
            }
            
            
            
        }
    }
}

struct PlanCardDetail_Previews: PreviewProvider {
    static var previews: some View {
        PlanPageDetail(detailType: "Confirmation", detail: "WUQ97A", copyButton: true)
            .preferredColorScheme(.dark)
    }
}
