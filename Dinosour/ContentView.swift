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
    @State var filter = "All"
    
    var body: some View {
        controller.filter(filter: filter)
        
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
                        withAnimation {
                            sortAlphabetical.toggle()
                        }
                    } label: {
                        if (sortAlphabetical) {
                            Image(systemName: "film")
                        } else {
                            Image(systemName: "textformat")
                        }
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Picker("Filter", selection: $filter.animation()) {
                            ForEach(controller.filters, id: \.self) { filter in
                                HStack {
                                    Text(filter)
                                    Spacer()
                                    Image(systemName: controller.filterIcon(filter: filter))
                                }
                            }
                        }
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView().preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
