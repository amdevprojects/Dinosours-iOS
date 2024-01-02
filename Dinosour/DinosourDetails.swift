//
//  DinosourDetails.swift
//  Dinosour
//
//  Created by TTNPL-3940 on 02/01/24.
//

import SwiftUI

struct DinosourDetails: View {
    let dinosour: Dinosour
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ZStack(alignment: .trailing) {
                    Image(dinosour.type)
                        .resizable()
                        .scaledToFit()
                    Image(dinosour.name.lowercased().replacingOccurrences(of: " ", with: ""))
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width / 1.5, height: UIScreen.main.bounds.height / 4)
                        .shadow(color: .white, radius: 1)
                        .rotation3DEffect(
                            .degrees(180),axis: (x: 0.0, y: 1.0, z: 0.0)
                        )
                }
                Text(dinosour.name)
                    .font(.largeTitle)
                    .padding(.top, 8)
                Text("Appears In")
                    .font(.title3)
                    .padding(.top, 8)
                ForEach(dinosour.movies, id: \.self) { movieName in
                    Text("-> \(movieName)")
                        .font(.subheadline)
                }
                Text("Movie Moments")
                    .font(.title)
                    .padding(.top, 8)
                ForEach(dinosour.movieScenes) { movieScene in
                    Text(movieScene.movie)
                        .font(.title2)
                    Text(movieScene.sceneDescription)
                }
                Text(dinosour.link)
                    .font(.caption)
                    .padding(.top, 8)
                Link(dinosour.link, destination: URL(string: dinosour.link)!)
                    .font(.caption)
                    .foregroundColor(.blue)
            }
        }.ignoresSafeArea()
    }
}
