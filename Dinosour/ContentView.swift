//
//  ContentView.swift
//  Dinosour
//
//  Created by TTNPL-3940 on 02/01/24.
//

import SwiftUI

struct ContentView: View {
    
    let controller = DinosourController()
    
    @State var sortAlphabetical = false
    
    var body: some View {
        if sortAlphabetical {
            controller.sortAlphabetical()
        } else {
            controller.sortByMovie()
        }
        
        return NavigationView {
            List {
                ForEach(controller.dinosours) { dinosour in
                    NavigationLink(destination: DinosourDetails(dinosour: dinosour)) {
                        DinosourRow(dinosour: dinosour)
                    }
                }
            }
            .navigationTitle("Dinosours")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        sortAlphabetical.toggle()
                    } label: {
                        if (sortAlphabetical) {
                            Image(systemName: "film")
                        } else {
                            Image(systemName: "textformat")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView().preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
