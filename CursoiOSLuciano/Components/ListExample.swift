//
//  ListExample.swift
//  CursoiOSLuciano
//
//  Created by Luciano de la Iglesia on 04/02/2025.
//

import SwiftUI

private var pokemons = [
    Pokemon(name: "Pikachu"),
    Pokemon(name: "Charmander"),
    Pokemon(name: "Charmeleon"),
    Pokemon(name: "Charizard")
]

private var digimons = [
    Digimon(name: "Agumon"),
    Digimon(name: "Greymon"),
    Digimon(name: "Metalgreymon"),
    Digimon(name: "Gabumon"),
    Digimon(name: "Garurumon"),
    Digimon(name: "Metalgarurumon")
]


struct ListExample: View {
    var body: some View {
//        List{
//            ForEach(pokemons, id:\.name) { pokemon in
//                Text(pokemon.name)
//            }
//        }
//        
//        List{
//            ForEach(digimons) { digimon in
//                Text(digimon.name)
//            }
//        }
//        
//        List(digimons){ digimon in
//            Text(digimon.name)
//        }
        
        List {
            Section(header: Text("Pokemons")){
                ForEach(pokemons, id:\.name) { pokemon in
                    Text(pokemon.name)
                }
            }
            Section(header: Text("Digimons")){
                ForEach(digimons) { digimon in
                    Text(digimon.name)
                }
            }
        }.listStyle(.grouped)
    }
}

struct Pokemon{
    let name: String
}

struct Digimon: Identifiable {
    var id = UUID()
    let name: String
}

#Preview {
    ListExample()
}
