//
//  MenuView.swift
//  CursoiOSLuciano
//
//  Created by Luciano de la Iglesia on 01/02/2025.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationStack{
            List {
                Section(header: Text("Apps List")){
                    NavigationLink(destination:IMCView()){
                        Text("IMC Calculator")
                    }
                    NavigationLink(destination: SuperheroFinder()) {
                        Text("Superhero finder")
                    }
                    NavigationLink(destination: FavPlaces()){
                        Text("Fav Places")
                    }
                }
            }.listStyle(.grouped)
        }
    }
}

#Preview {
    MenuView()
}
