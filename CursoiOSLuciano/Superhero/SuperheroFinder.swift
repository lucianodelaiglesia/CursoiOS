//
//  SuperheroSearcher.swift
//  CursoiOSLuciano
//
//  Created by Luciano de la Iglesia on 04/02/2025.
//

import SwiftUI

struct SuperheroFinder: View {
    @State var superheroName: String = ""
    @State var wrapper: ApiNetwork.Wrapper? = nil
    @State var loading: Bool = false
    
    var body: some View {
        VStack{
            TextField("",
                      text: $superheroName,
                      prompt: Text("Search your favorite Superhero").bold().font(.title2).foregroundColor(.gray))
            .bold()
            .font(.title2)
            .foregroundColor(.white)
            .padding(16)
            .border(.purple, width: 2)
            .padding(8)
            .autocorrectionDisabled()
            .onSubmit {
                loading = true
                
                Task{
                    do{
                        wrapper = try await ApiNetwork().getHeroesByQuery(query: superheroName)
                    }
                    catch{
                        print("Error")
                    }
                    loading = false
                }
            }
            
            if loading{
                ProgressView().tint(.white)
            }
            NavigationStack{
                List(wrapper?.results ?? []){ superhero in
                    ZStack{
                        SuperheroItem(superhero: superhero)
                        NavigationLink(destination: SuperheroDetail(id: superhero.id)){
                            EmptyView()
                        }.opacity(0)
                    }.listRowBackground(Color.backgroundApp)
                }.listStyle(.plain)
            }
            Spacer()
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(.backgroundApp)
    }
}

struct SuperheroItem: View{
    var superhero: ApiNetwork.Superhero
    var body: some View
    {
        ZStack{
            AsyncImage(url: URL(string: superhero.image.url)) {image in
                image.resizable()
                    .scaledToFill()
                    .frame(height: 200)
            } placeholder: {
                ProgressView().tint(.white)
            }
            
            VStack{
                Spacer()
                Text(superhero.name).foregroundColor(.white)
                    .font(.title)
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.white.opacity(0.5))
            }
        }.frame(height: 200)
            .cornerRadius(32)
    }
}

#Preview {
    SuperheroFinder()
}
