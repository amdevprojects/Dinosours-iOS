//
//  DinosourRow.swift
//  Dinosour
//
//  Created by TTNPL-3940 on 02/01/24.
//

import SwiftUI

struct DinosourRow: View {
    let dinosour: Dinosour
    
    var body: some View {
        HStack {
            Image(dinosour.name.lowercased().replacingOccurrences(of: " ", with: ""))
                .resizable()
                .scaledToFit()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                .shadow(color: .white, radius: 1)
            
            VStack(alignment: .leading) {
                Text(dinosour.name)
                    .fontWeight(.bold)
                Text(dinosour.type.capitalized)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .padding(.horizontal, 13)
                    .padding(.vertical, 5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20.0)
                            .fill(dinosour.typeOverlay().opacity(0.33))
                    )
            }
        }
    }
}
